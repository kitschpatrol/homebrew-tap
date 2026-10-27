import { execFileSync } from 'node:child_process'
import fs from 'node:fs/promises'
import os from 'node:os'
import path from 'node:path'
import type { TapMetadata } from '../tap-metadata.ts'

/**
 * Apply the maintained local adaptations, failing if upstream is no longer
 * compatible.
 */
export async function applyMirrorPatch(source: string, patchPath: string): Promise<string> {
	const temporaryDirectory = await fs.mkdtemp(path.join(os.tmpdir(), 'homebrew-mirror-'))
	try {
		await fs.writeFile(path.join(temporaryDirectory, 'source.rb'), source)
		execFileSync('git', ['apply', '--verbose', path.resolve(patchPath)], {
			cwd: temporaryDirectory,
			encoding: 'utf8',
			stdio: ['ignore', 'pipe', 'pipe'],
		})
		return await fs.readFile(path.join(temporaryDirectory, 'source.rb'), 'utf8')
	} finally {
		await fs.rm(temporaryDirectory, { force: true, recursive: true })
	}
}

async function syncMirrors(write: boolean): Promise<void> {
	const metadata = JSON.parse(await fs.readFile('tap_metadata.json', 'utf8')) as TapMetadata
	const updates: Array<{ content: string; filePath: string }> = []

	for (const [key, entry] of Object.entries(metadata)) {
		if (entry.type !== 'mirror' || entry.updateStrategy !== 'upstream') {
			continue
		}

		const [kind, name] = key.split('/', 2)
		if (
			kind !== 'formula' ||
			name === undefined ||
			entry.upstreamTap === undefined ||
			entry.upstreamPath === undefined
		) {
			throw new Error(`Incomplete upstream formula metadata for ${key}`)
		}

		const [owner, tap] = entry.upstreamTap.split('/', 2)
		if (owner === undefined || tap === undefined) {
			throw new Error(`Invalid upstream tap for ${key}`)
		}

		const repository = `${owner}/homebrew-${tap}`
		const headers: Record<string, string> = { accept: 'application/vnd.github.raw+json' }
		if (process.env.GITHUB_TOKEN !== undefined) {
			headers.authorization = `Bearer ${process.env.GITHUB_TOKEN}`
		}

		const response = await fetch(
			`https://api.github.com/repos/${repository}/contents/${entry.upstreamPath}`,
			{ headers, signal: AbortSignal.timeout(30_000) },
		)
		if (!response.ok) {
			throw new Error(`Unable to fetch ${key}: ${response.status} ${response.statusText}`)
		}

		const adapted = await applyMirrorPatch(await response.text(), `scripts/mirrors/${name}.patch`)
		const content = `# Source: https://github.com/${repository}/blob/HEAD/${entry.upstreamPath}\n${adapted}`
		const filePath = `Formula/${name}.rb`
		if ((await fs.readFile(filePath, 'utf8')) !== content) {
			updates.push({ content, filePath })
		}
	}

	// Fetch and patch every recipe before writing so a failed sync leaves the tap untouched.
	for (const update of updates) {
		console.info(`${write ? 'Updating' : 'Would update'} ${update.filePath}`)
		if (write) {
			await fs.writeFile(update.filePath, update.content)
		}
	}

	if (updates.length === 0) {
		console.info('Formula mirrors match their upstream taps and local patches.')
	}
}

if (process.argv[1] !== undefined && path.resolve(process.argv[1]) === import.meta.filename) {
	if (process.argv.slice(2).some((argument) => argument !== '--write')) {
		throw new Error('Usage: node scripts/sync-mirrors.ts [--write]')
	}

	await syncMirrors(process.argv.includes('--write'))
}
