import { eslintConfig } from '@kitschpatrol/eslint-config'

export default eslintConfig(
	{},
	{
		files: ['README.md'],
		rules: {
			'unicorn/filename-case': 'off',
		},
	},
	{
		// The scheduled sync uses Node's built-in runner without installing dependencies.
		files: ['scripts/*.test.ts'],
		rules: {
			'test/no-import-node-test': 'off',
		},
	},
)
