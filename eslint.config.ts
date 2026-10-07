import { eslintConfig } from '@kitschpatrol/eslint-config'

export default eslintConfig(
	{},
	{
		files: ['README.md'],
		rules: {
			'unicorn/filename-case': 'off',
		},
	},
)
