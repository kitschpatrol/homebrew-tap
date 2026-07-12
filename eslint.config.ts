import { eslintConfig } from '@kitschpatrol/eslint-config'

export default eslintConfig(
	{
		ignores: ['/Casks/', '/Formula/'],
		json: {
			overrides: {
				'json-package/require-version': 'off',
			},
		},
	},
	{
		files: ['README.md'],
		rules: {
			'unicorn/filename-case': 'off',
		},
	},
)
