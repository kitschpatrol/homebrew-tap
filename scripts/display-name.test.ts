import assert from 'node:assert/strict'
import { test } from 'node:test'
import { getDisplayName, getFormulaDisplayName, titleCase } from '../display-name.ts'

test('automatic formula names retain acronyms and lowercase connecting words', () => {
	assert.deepEqual(
		[
			getFormulaDisplayName('StarlightToPdf'),
			getFormulaDisplayName('ToolsAndTipsForTheCli'),
			getFormulaDisplayName('ToAndFro'),
			getFormulaDisplayName('ThingsToLookAt'),
			getFormulaDisplayName('Metascope'),
		],
		[
			'Starlight to PDF',
			'Tools and Tips for the CLI',
			'To and Fro',
			'Things to Look At',
			'Metascope',
		],
	)
})

test('metadata overrides preserve exact casing and punctuation', () => {
	assert.deepEqual(
		[
			getFormulaDisplayName('EsCheckMin', { displayName: 'ES Check Min' }),
			getFormulaDisplayName('OsxphotosMirror', { displayName: 'OSXPhotos', type: 'mirror' }),
			getDisplayName('Hex', { displayName: 'HEX' }),
			getDisplayName('Msedit', { displayName: 'Edit' }),
			getDisplayName('A Tool to Remember', { displayName: 'A Tool To Remember' }),
		],
		['ES Check Min', 'OSXPhotos', 'HEX', 'Edit', 'A Tool To Remember'],
	)
})

test('automatic names remain the fallback and mirror suffix cleanup respects overrides', () => {
	assert.deepEqual(
		[
			getDisplayName('DeskMat'),
			getDisplayName('SheepShaver', { type: 'third-party' }),
			getFormulaDisplayName('TerraformMirror', { type: 'mirror' }),
			getFormulaDisplayName('MagicMirror'),
			getFormulaDisplayName('MagicMirror', { displayName: 'Magic Mirror', type: 'mirror' }),
			titleCase('first party'),
		],
		['DeskMat', 'SheepShaver', 'Terraform', 'Magic Mirror', 'Magic Mirror', 'First Party'],
	)
})
