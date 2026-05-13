/* eslint-disable e18e/prefer-static-regex */

import { mdatConfig } from '@kitschpatrol/mdat-config'
import fs from 'node:fs/promises'
import path from 'node:path'

type ItemInfo = {
	description: string
	filePath: string
	homepage: string
	itemName: string // Cask name or formula name
	name: string // Display name
	type: string // Folder name, 'custom' | 'fork' | 'pinned'
	version: string
}

type MigratedFormulaInfo = {
	description: string
	homepage: string
	itemName: string // Formula name
	name: string // Display name
	tap: string // Destination tap (e.g. 'homebrew/core')
}

// A proper parse would be smarter, but this is fast and good enough
async function parseCaskFile(filePath: string): Promise<ItemInfo> {
	const content = await fs.readFile(filePath, 'utf8')

	const caskNameMatch = /cask\s+"([^"]+)"/.exec(content)
	const nameMatch = /name\s+"([^"]+)"/.exec(content)
	const description = /desc\s+"([^"]+)"/.exec(content)
	const versionMatch = /version\s+"([^"]+)"/.exec(content)
	const homepageMatch = /homepage\s+"([^"]+)"/.exec(content)

	if (!caskNameMatch || !description || !versionMatch || !nameMatch || !homepageMatch) {
		throw new Error('Unable to parse cask file')
	}

	return {
		description: description[1],
		filePath,
		homepage: homepageMatch[1],
		itemName: caskNameMatch[1],
		name: nameMatch[1],
		type: path.dirname(filePath).split(path.sep).pop() ?? 'unknown',
		version: versionMatch[1],
	}
}

async function parseFormulaFile(filePath: string): Promise<ItemInfo> {
	const content = await fs.readFile(filePath, 'utf8')

	const classNameMatch = /class\s+(\w+)\s+<\s+Formula/.exec(content)
	const description = /desc\s+"([^"]+)"/.exec(content)
	const homepageMatch = /homepage\s+"([^"]+)"/.exec(content)
	const urlMatch = /url\s+"([^"]+)"/.exec(content)

	if (!classNameMatch || !description || !homepageMatch) {
		throw new Error('Unable to parse formula file')
	}

	// Extract version from URL if possible (common patterns like v1.2.3 or 1.2.3)
	let version = 'unknown'
	if (urlMatch) {
		const versionMatch = /v?(\d+\.\d+(?:\.\d+)?)/.exec(urlMatch[1])
		if (versionMatch) {
			version = versionMatch[1]
		}
	}

	// Convert class name to display name (e.g., "ExampleTool" -> "Example Tool")
	const displayName = classNameMatch[1].replaceAll(/([A-Z])/g, ' $1').trim()

	return {
		description: description[1],
		filePath,
		homepage: homepageMatch[1],
		itemName: classNameMatch[1]
			.toLowerCase()
			.replaceAll(/([A-Z])/g, '-$1')
			.replaceAll(/^-/g, ''), // Convert to kebab-case for formula name
		name: displayName,
		type: path.dirname(filePath).split(path.sep).pop() ?? 'unknown',
		version,
	}
}

function titleCase(string_: string): string {
	return string_.replaceAll(/\b\w/g, (c) => c.toUpperCase())
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
			titleCase(item.type),
		]
		table += `| ${row.join(' | ')} |\n`
	}

	return table
}

async function getCasks(glob: string, excludeCasks: string[] = []): Promise<ItemInfo[]> {
	const casks: ItemInfo[] = []
	for await (const entry of fs.glob(glob)) {
		const cask = await parseCaskFile(entry)
		if (!excludeCasks.includes(cask.itemName)) {
			casks.push(cask)
		}
	}

	return casks.toSorted((a, b) => a.name.localeCompare(b.name))
}

async function getFormulas(glob: string, excludeFormulas: string[] = []): Promise<ItemInfo[]> {
	const formulas: ItemInfo[] = []
	for await (const entry of fs.glob(glob)) {
		const formula = await parseFormulaFile(entry)
		if (!excludeFormulas.includes(formula.itemName)) {
			formulas.push(formula)
		}
	}

	return formulas.toSorted((a, b) => a.name.localeCompare(b.name))
}

async function getCasksTable(): Promise<string> {
	const casks = await getCasks('./Casks/**/*.rb', ['sheepshaver-folder'])
	return createMarkdownTable(casks, 'cask')
}

async function getFormulasTable(): Promise<string> {
	const formulas = await getFormulas('./Formula/**/*.rb')
	return createMarkdownTable(formulas, 'formula')
}

async function fetchHomebrewCoreFormula(name: string): Promise<{ desc: string; homepage: string }> {
	const response = await fetch(`https://formulae.brew.sh/api/formula/${name}.json`)
	if (!response.ok) {
		throw new Error(
			`Failed to fetch formula info for "${name}": ${response.status} ${response.statusText}`,
		)
	}

	// eslint-disable-next-line ts/no-unsafe-type-assertion
	return response.json() as Promise<{ desc: string; homepage: string }>
}

function tapToUrl(tap: string): string {
	const [user, name] = tap.split('/')
	return `https://github.com/${user}/homebrew-${name}`
}

async function getMigratedFormulas(): Promise<MigratedFormulaInfo[]> {
	let content: string
	try {
		content = await fs.readFile('./tap_migrations.json', 'utf8')
	} catch {
		return []
	}

	// eslint-disable-next-line ts/no-unsafe-type-assertion
	const migrations = JSON.parse(content) as Record<string, string>

	const items = await Promise.all(
		Object.entries(migrations).map(async ([formulaName, tap]): Promise<MigratedFormulaInfo> => {
			const info = await fetchHomebrewCoreFormula(formulaName)
			return {
				description: info.desc,
				homepage: info.homepage,
				itemName: formulaName,
				name: titleCase(formulaName.replaceAll('-', ' ')),
				tap,
			}
		}),
	)

	return items.toSorted((a, b) => a.name.localeCompare(b.name))
}

function createMigratedFormulasTable(items: MigratedFormulaInfo[]): string {
	if (items.length === 0) {
		return '_None yet._'
	}

	const headers = ['Name', 'Description', 'Formula', 'Migrated to Tap']
	let table = `| ${headers.join(' | ')} |\n`
	table += `| ${headers.map(() => '---').join(' | ')} |\n`

	for (const item of items) {
		const row = [
			`[${item.name}](${item.homepage})`,
			item.description,
			`[${item.itemName}](https://formulae.brew.sh/formula/${item.itemName})`,
			`[${item.tap}](${tapToUrl(item.tap)})`,
		]
		table += `| ${row.join(' | ')} |\n`
	}

	return table
}

async function getMigratedFormulasTable(): Promise<string> {
	const migrated = await getMigratedFormulas()
	return createMigratedFormulasTable(migrated)
}

export default mdatConfig({
	casks: getCasksTable,
	formulas: getFormulasTable,
	formulasMigrated: getMigratedFormulasTable,
})
