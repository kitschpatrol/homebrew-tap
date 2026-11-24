import { cspellConfig } from '@kitschpatrol/cspell-config'

export default cspellConfig({
	ignoreRegExpList: [
		'  version ".+', // Ignore version strings in Ruby files
	],
	words: ['ecterm', 'emmmm', 'rlkey', 'servicedir', 'testpath', 'tibs', 'wpdos'],
})
