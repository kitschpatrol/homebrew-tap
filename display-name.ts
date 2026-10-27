import type { TapMetadata } from './tap-metadata.ts'

const acronyms = new Set(['CLI', 'PDF'])
const smallWords = new Set([
	'a',
	'an',
	'and',
	'as',
	'at',
	'but',
	'by',
	'for',
	'from',
	'in',
	'nor',
	'of',
	'on',
	'or',
	'so',
	'the',
	'to',
	'via',
	'with',
	'yet',
])
const wordSeparator = /\s+/v
const capitalLetter = /([A-Z])/gv
const mirrorSuffix = /Mirror$/v

/** Format generated titles with acronyms and lowercase connecting words. */
export function titleCase(value: string): string {
	const words = value.trim().split(wordSeparator)
	return words
		.map((word, index) => {
			const uppercase = word.toUpperCase()
			if (acronyms.has(uppercase)) {
				return uppercase
			}

			const lowercase = word.toLowerCase()
			return index > 0 && index < words.length - 1 && smallWords.has(lowercase)
				? lowercase
				: word.charAt(0).toUpperCase() + word.slice(1)
		})
		.join(' ')
}

/** Prefer a metadata display name over the automatically generated label. */
export function getDisplayName(fallback: string, metadata?: TapMetadata[string]): string {
	return metadata?.displayName ?? fallback
}

/** Derive a formula label from its class, retaining exact metadata overrides. */
export function getFormulaDisplayName(className: string, metadata?: TapMetadata[string]): string {
	const name = metadata?.type === 'mirror' ? className.replace(mirrorSuffix, '') : className
	return getDisplayName(titleCase(name.replaceAll(capitalLetter, ' $1').trim()), metadata)
}
