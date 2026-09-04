import { cspellConfig } from '@kitschpatrol/cspell-config'

export default cspellConfig({
	ignoreRegExpList: [
		'  version ".+', // Ignore version strings in Ruby files
	],
	words: [
		'binarycookies',
		'crashreporter',
		'eney',
		'nurb',
		'plausiblelabs',
		'postflight',
		'publicspace',
		'rlkey',
		'sharedfilelist',
		'sonoma',
		'timpler',
		'wpdos',
	],
})
