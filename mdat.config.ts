import { mdatConfig } from '@kitschpatrol/mdat-config'
import fs from 'node:fs/promises'
import path from 'node:path'

type CaskInfo = {
	caskName: string
	description: string
	filePath: string
	homepage: string
	name: string
	type: string // Folder name, 'custom' | 'fork' | 'pinned'
	version: string
}

// A proper parse would be smarter, but this is fast and good enough
async function parseCaskFile(filePath: string): Promise<CaskInfo> {
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
		caskName: caskNameMatch[1],
		description: description[1],
		filePath,
		homepage: homepageMatch[1],
		name: nameMatch[1],
		type: path.dirname(filePath).split(path.sep).pop() ?? 'unknown',
		version: versionMatch[1],
	}
}

function titleCase(string_: string): string {
	return string_.replaceAll(/\b\w/g, (c) => c.toUpperCase())
}

function createMarkdownTable(casks: CaskInfo[]): string {
	const headers = ['Application', 'Description', 'Cask', 'Type']
	let table = `| ${headers.join(' | ')} |\n`
	table += `| ${headers.map(() => '---').join(' | ')} |\n`

	for (const cask of casks) {
		const row = [
			`[${cask.name}](${cask.homepage})`,
			cask.description,
			`[${cask.caskName}](${cask.filePath})`,
			titleCase(cask.type),
		]
		table += `| ${row.join(' | ')} |\n`
	}

	return table
}

async function getCasks(glob: string, excludeCasks: string[] = []): Promise<CaskInfo[]> {
	const casks: CaskInfo[] = []
	for await (const entry of fs.glob(glob)) {
		const cask = await parseCaskFile(entry)
		if (!excludeCasks.includes(cask.caskName)) {
			casks.push(cask)
		}
	}

	return casks.sort((a, b) => a.name.localeCompare(b.name))
}

async function getCasksTable(): Promise<string> {
	const casks = await getCasks('./Casks/**/*.rb', ['sheepshaver-folder'])
	return createMarkdownTable(casks)
}

export default mdatConfig({
	rules: {
		casks: getCasksTable,
	},
})
