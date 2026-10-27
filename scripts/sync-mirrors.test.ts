import assert from 'node:assert/strict'
import fs from 'node:fs/promises'
import { test } from 'node:test'
import { applyMirrorPatch } from './sync-mirrors.ts'

const platformSources = /^ {4}(?:url|sha256) .+$/gmv
const pypiPath = /packages\/[^"]+/v
const sourceChecksum = /^ {2}sha256 .+$/mv
const sourceUrl = /^ {2}url .+$/mv

test('Terraform sync retains every platform URL and checksum on a version bump', async () => {
	const original = await fs.readFile('scripts/fixtures/terraform.rb', 'utf8')
	const upstream = original.replaceAll('1.17.0', '9.8.7')
	const actual = await applyMirrorPatch(upstream, 'scripts/mirrors/terraform-mirror.patch')

	assert.deepEqual(
		{
			classRenamed: actual.includes('class TerraformMirror < Formula'),
			sources: actual.match(platformSources),
			syncOnly: actual.includes('skip "Updated from the upstream tap'),
		},
		{
			classRenamed: true,
			sources: upstream.match(platformSources),
			syncOnly: true,
		},
	)
})

test('OSXPhotos sync retains new PyPI hashes and Python dependencies', async () => {
	const original = await fs.readFile('scripts/fixtures/osxphotos.rb', 'utf8')
	const upstream = original
		.replaceAll('0.77.2', '9.8.7')
		.replace('python@3.13', 'python@3.15')
		.replace(pypiPath, 'packages/new-hash/osxphotos-9.8.7.tar.gz')
	const actual = await applyMirrorPatch(upstream, 'scripts/mirrors/osxphotos-mirror.patch')

	assert.deepEqual(
		{
			checksum: sourceChecksum.exec(actual)?.[0],
			classRenamed: actual.includes('class OsxphotosMirror < Formula'),
			python: actual.includes('depends_on "python@3.15"'),
			test: actual.includes('#{bin}/osxphotos --version'),
			url: sourceUrl.exec(actual)?.[0],
		},
		{
			checksum: sourceChecksum.exec(upstream)?.[0],
			classRenamed: true,
			python: true,
			test: true,
			url: sourceUrl.exec(upstream)?.[0],
		},
	)
})

test('incompatible upstream changes fail instead of dropping local adaptations', async () => {
	await assert.rejects(
		applyMirrorPatch('class Renamed < Formula\nend\n', 'scripts/mirrors/terraform-mirror.patch'),
	)
})
