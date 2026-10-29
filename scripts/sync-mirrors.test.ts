import assert from 'node:assert/strict'
import fs from 'node:fs/promises'
import { test } from 'node:test'
import { applyMirrorPatch, detectVersion } from './sync-mirrors.ts'

const platformSources = /^ {4}(?:url|sha256) .+$/gmv
const pypiPath = /packages\/[^"]+/v
const sourceChecksum = /^ {2}sha256 .+$/mv
const sourceUrl = /^ {2}url .+$/mv

// Store upstream snapshots as text so brew style does not lint them as tap Ruby.
test('Terraform sync retains every platform URL and checksum on a version bump', async () => {
	const original = await fs.readFile('scripts/fixtures/terraform.rb.txt', 'utf8')
	const upstream = original.replaceAll('1.17.0', '9.8.7')
	const actual = await applyMirrorPatch(upstream, 'scripts/mirrors/terraform-mirror.patch')

	assert.deepEqual(
		{
			classRenamed: actual.includes('class TerraformMirror < Formula'),
			sources: actual.match(platformSources),
			syncOnly: actual.includes('skip "Updated from the upstream tap'),
			upstreamConflict: actual.includes('conflicts_with "hashicorp/tap/terraform"'),
		},
		{
			classRenamed: true,
			sources: upstream.match(platformSources),
			syncOnly: true,
			upstreamConflict: true,
		},
	)
})

test('OSXPhotos sync retains new PyPI hashes and Python dependencies', async () => {
	const original = await fs.readFile('scripts/fixtures/osxphotos.rb.txt', 'utf8')
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
			upstreamConflict: actual.includes('conflicts_with "rhettbull/osxphotos/osxphotos"'),
			url: sourceUrl.exec(actual)?.[0],
		},
		{
			checksum: sourceChecksum.exec(upstream)?.[0],
			classRenamed: true,
			python: true,
			test: true,
			upstreamConflict: true,
			url: sourceUrl.exec(upstream)?.[0],
		},
	)
})

test('incompatible upstream changes fail instead of dropping local adaptations', async () => {
	await assert.rejects(
		applyMirrorPatch('class Renamed < Formula\nend\n', 'scripts/mirrors/terraform-mirror.patch'),
	)
})

test('explicit version calls take precedence over source URLs', async () => {
	const original = await fs.readFile('scripts/fixtures/terraform.rb.txt', 'utf8')
	const upstream = original.replace('version "1.17.0"', 'version "9.8.7"')

	assert.equal(detectVersion(upstream), '9.8.7')
})

test('versions without a version call come from the source archive name', async () => {
	const original = await fs.readFile('scripts/fixtures/osxphotos.rb.txt', 'utf8')
	const upstream = original.replace(pypiPath, 'packages/new-hash/osxphotos-9.8.7.tar.gz')

	assert.equal(detectVersion(upstream), '9.8.7')
})

test('recipes without a detectable version are reported instead of guessed', () => {
	const upstream = 'class Mystery < Formula\n  url "https://example.com/mystery.tar.gz"\nend\n'

	assert.equal(detectVersion(upstream), undefined)
})
