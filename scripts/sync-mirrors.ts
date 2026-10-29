import { execFileSync } from 'node:child_process'
import fs from 'node:fs/promises'
import os from 'node:os'
import path from 'node:path'
import type { TapMetadata } from '../tap-metadata.ts'

const explicitVersion = /^ {2}version "(?<version>[^"]+)"$/mv
const sourceArchive = /^ {2}url "[^"]*\/(?<archive>[^"\/]+)"$/mv
const archiveVersion = /-(?<version>\d[\w.\-]*?)\.(?:tar\.gz|tar\.xz|tar\.bz2|tgz|zip)$/v

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

/**
 * Read a recipe's version the way Homebrew does: an explicit `version` call,
 * otherwise the version embedded in the stable source archive name.
 */
export function detectVersion(source: string): string | undefined {
	const explicit = explicitVersion.exec(source)?.groups?.version
	if (explicit !== undefined) {
		return explicit
	}

	const archive = sourceArchive.exec(source)?.groups?.archive ?? ''
	return archiveVersion.exec(archive)?.groups?.version
}

async function syncMirrors(options: { json: boolean; write: boolean }): Promise<void> {
	const metadata = JSON.parse(await fs.readFile('tap_metadata.json', 'utf8')) as TapMetadata
	const updates: Array<{
		content: string
		filePath: string
		name: string
		source: string
		version: string
	}> = []

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

		const upstream = await response.text()
		const version = detectVersion(upstream)
		if (version === undefined) {
			throw new Error(`Unable to detect the version of ${key} from its upstream recipe`)
		}

		const adapted = await applyMirrorPatch(upstream, `scripts/mirrors/${name}.patch`)
		const source = `https://github.com/${repository}/blob/HEAD/${entry.upstreamPath}`
		const content = `# Source: ${source}\n${adapted}`
		const filePath = `Formula/${name}.rb`
		if ((await fs.readFile(filePath, 'utf8')) !== content) {
			updates.push({ content, filePath, name, source, version })
		}
	}

	// Fetch and patch every recipe before writing so a failed sync leaves the tap untouched.
	for (const update of updates) {
		if (!options.json) {
			console.info(
				`${options.write ? 'Updating' : 'Would update'} ${update.name} to ${update.version}`,
			)
		}

		if (options.write) {
			await fs.writeFile(update.filePath, update.content)
		}
	}

	if (options.json) {
		console.info(
			JSON.stringify(updates.map(({ name, source, version }) => ({ name, source, version }))),
		)
	} else if (updates.length === 0) {
		console.info('Formula mirrors match their upstream taps and local patches.')
	}
}

if (process.argv[1] !== undefined && path.resolve(process.argv[1]) === import.meta.filename) {
	const flags = process.argv.slice(2)
	if (flags.some((flag) => flag !== '--json' && flag !== '--write')) {
		throw new Error('Usage: node scripts/sync-mirrors.ts [--write] [--json]')
	}

	await syncMirrors({ json: flags.includes('--json'), write: flags.includes('--write') })
}
