/* eslint-disable e18e/prefer-static-regex */

import { mdatConfig } from '@kitschpatrol/mdat-config'
import { execFileSync } from 'node:child_process'
import fs from 'node:fs/promises'
import path from 'node:path'

type TapMetadata = Record<
	string,
	{ type?: 'first-party' | 'fork' | 'mirror' | 'pin' | 'third-party' }
>

type ItemInfo = {
	description: string
	filePath: string
	homepage: string
	itemName: string // Cask name or formula name
	name: string // Display name
	type: 'unknown' | NonNullable<TapMetadata[string]['type']>
	version: string
}

type MigratedItemInfo = {
	date: string
	description: string
	homepage: string
	itemName: string // Cask name or formula name
	itemType: 'cask' | 'formula'
	name: string // Display name
	tap: string // Destination tap (e.g. 'homebrew/core' or 'homebrew/cask')
}

// A proper parse would be smarter, but this is fast and good enough
async function parseCaskFile(filePath: string, metadata: TapMetadata): Promise<ItemInfo> {
	const content = await fs.readFile(filePath, 'utf8')

	const caskName = /cask\s+"([^"]+)"/v.exec(content)?.[1]
	const name = /name\s+"([^"]+)"/v.exec(content)?.[1]
	const description = /desc\s+"([^"]+)"/v.exec(content)?.[1]
	const version = /version\s+"([^"]+)"/v.exec(content)?.[1]
	const homepage = /homepage\s+"([^"]+)"/v.exec(content)?.[1]

	if (
		caskName === undefined ||
		name === undefined ||
		description === undefined ||
		version === undefined ||
		homepage === undefined
	) {
		throw new Error('Unable to parse cask file')
	}

	return {
		description,
		filePath,
		homepage,
		itemName: caskName,
		name,
		type: metadata[`cask/${caskName}`]?.type ?? 'unknown',
		version,
	}
}

async function parseFormulaFile(filePath: string, metadata: TapMetadata): Promise<ItemInfo> {
	const content = await fs.readFile(filePath, 'utf8')

	const className = /class\s+(\w+)\s+<\s+Formula/v.exec(content)?.[1]
	const description = /desc\s+"([^"]+)"/v.exec(content)?.[1]
	const homepage = /homepage\s+"([^"]+)"/v.exec(content)?.[1]

	if (className === undefined || description === undefined || homepage === undefined) {
		throw new Error('Unable to parse formula file')
	}

	const url = /url\s+"([^"]+)"/v.exec(content)?.[1]
	const npmPackage = /^https?:\/\/registry\.npmjs\.org\/((?:@[^\/]+\/)?[^\/]+)\/-\//v.exec(
		url ?? '',
	)?.[1]

	// Extract version from URL if possible (common patterns like v1.2.3 or 1.2.3)
	let version = 'unknown'
	if (url !== undefined) {
		const extractedVersion = /v?(\d+\.\d+(?:\.\d+)?)/v.exec(url)?.[1]
		if (extractedVersion !== undefined) {
			version = extractedVersion
		}
	}

	// Convert class name to display name (e.g., "ExampleTool" -> "Example Tool")
	const displayName = className.replaceAll(/([A-Z])/gv, ' $1').trim()

	return {
		description:
			npmPackage === undefined
				? description
				: `${description} (Also on [npm](https://www.npmjs.com/package/${decodeURIComponent(npmPackage)}))`,
		filePath,
		homepage,
		// Homebrew derives the formula name from the file name, not the class name
		itemName: path.basename(filePath, '.rb'),
		name: displayName,
		type: metadata[`formula/${path.basename(filePath, '.rb')}`]?.type ?? 'unknown',
		version,
	}
}

function titleCase(string_: string): string {
	return string_.replaceAll(/\b\w/gv, (c) => c.toUpperCase())
}

function createMarkdownTable(items: ItemInfo[], itemType: 'cask' | 'formula' = 'cask'): string {
	if (items.length === 0) {
		return '_None yet._'
	}

	const headers = ['Name', 'Description', itemType === 'cask' ? 'Cask' : 'Formula', 'Type']
	let table = `| ${headers.join(' | ')} |\n`
	table += `| ${headers.map(() => '---').join(' | ')} |\n`

	for (const item of items) {
		const row = [
			`[${item.name}](${item.homepage})`,
			item.description,
			`[${item.itemName}](${item.filePath})`,
			titleCase(item.type.replaceAll('-', ' ')),
		]
		table += `| ${row.join(' | ')} |\n`
	}

	return table
}

async function getTapMetadata(): Promise<TapMetadata> {
	return JSON.parse(await fs.readFile('./tap-metadata.json', 'utf8')) as TapMetadata
}

async function getCasks(glob: string, excludeCasks: string[] = []): Promise<ItemInfo[]> {
	const metadata = await getTapMetadata()
	const casks: ItemInfo[] = []
	// Glob is backported to ^22.17.0

	for await (const entry of fs.glob(glob)) {
		const cask = await parseCaskFile(entry, metadata)
		if (!excludeCasks.includes(cask.itemName)) {
			casks.push(cask)
		}
	}

	return casks.toSorted((a, b) => a.name.localeCompare(b.name))
}

async function getFormulas(glob: string, excludeFormulas: string[] = []): Promise<ItemInfo[]> {
	const metadata = await getTapMetadata()
	const formulas: ItemInfo[] = []
	// Glob is backported to ^22.17.0

	for await (const entry of fs.glob(glob)) {
		const formula = await parseFormulaFile(entry, metadata)
		if (!excludeFormulas.includes(formula.itemName)) {
			formulas.push(formula)
		}
	}

	return formulas.toSorted((a, b) => a.name.localeCompare(b.name))
}

async function getCasksTable(): Promise<string> {
	const casks = await getCasks('./Casks/*.rb', ['sheepshaver-folder'])
	return createMarkdownTable(casks, 'cask')
}

async function getFormulasTable(): Promise<string> {
	const formulas = await getFormulas('./Formula/*.rb')
	return createMarkdownTable(formulas, 'formula')
}

async function fetchHomebrewItem(
	name: string,
	itemType: 'cask' | 'formula',
): Promise<{ desc: string; homepage: string }> {
	const response = await fetch(`https://formulae.brew.sh/api/${itemType}/${name}.json`)
	if (!response.ok) {
		throw new Error(
			`Failed to fetch ${itemType} info for "${name}": ${response.status} ${response.statusText}`,
		)
	}

	return response.json() as Promise<{ desc: string; homepage: string }>
}

function tapToUrl(tap: string): string {
	const [user, name] = tap.split('/', 2)
	return `https://github.com/${user}/homebrew-${name}`
}

function getMigrationDate(itemName: string): string {
	// Find the first commit introducing this key, ignoring later edits to its line.
	const stdout = execFileSync(
		'git',
		[
			'log',
			'--reverse',
			'--format=%cs',
			`-S${JSON.stringify(itemName)}`,
			'--',
			'tap_migrations.json',
		],
		{ encoding: 'utf8' },
	)
	const [date] = stdout.trim().split('\n', 1)
	return date === undefined || date === '' ? 'Unknown' : date
}

async function getMigratedItems(): Promise<MigratedItemInfo[]> {
	let content: string
	try {
		content = await fs.readFile('./tap_migrations.json', 'utf8')
	} catch {
		return []
	}

	const migrations = JSON.parse(content) as Record<string, string>

	const items = await Promise.all(
		Object.entries(migrations).map(async ([itemName, tap]): Promise<MigratedItemInfo> => {
			const itemType = tap === 'homebrew/cask' ? 'cask' : 'formula'
			const info = await fetchHomebrewItem(itemName, itemType)
			return {
				date: getMigrationDate(itemName),
				description: info.desc,
				homepage: info.homepage,
				itemName,
				itemType,
				name: titleCase(itemName.replaceAll('-', ' ')),
				tap,
			}
		}),
	)

	return items.toSorted((a, b) => a.name.localeCompare(b.name))
}

function createMigratedItemsTable(items: MigratedItemInfo[]): string {
	if (items.length === 0) {
		return '_None yet._'
	}

	const headers = ['Name', 'Description', 'Cask / Formula', 'Migrated to Tap', 'Date']
	let table = `| ${headers.join(' | ')} |\n`
	table += `| ${headers.map(() => '---').join(' | ')} |\n`

	for (const item of items) {
		const row = [
			`[${item.name}](${item.homepage})`,
			item.description,
			`[${item.itemName}](https://formulae.brew.sh/${item.itemType}/${item.itemName})`,
			`[${item.tap}](${tapToUrl(item.tap)})`,
			item.date,
		]
		table += `| ${row.join(' | ')} |\n`
	}

	return table
}

async function getMigratedItemsTable(): Promise<string> {
	const migrated = await getMigratedItems()
	return createMigratedItemsTable(migrated)
}

export default mdatConfig({
	casks: getCasksTable,
	formulas: getFormulasTable,
	migrated: getMigratedItemsTable,
})
