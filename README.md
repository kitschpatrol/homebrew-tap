# kitschpatrol/tap

<!-- badges({
  npm: false,
  custom:{
    'brew test-bot': {
      image: "https://github.com/kitschpatrol/homebrew-tap/actions/workflows/tests.yml/badge.svg",
      link: "https://github.com/kitschpatrol/homebrew-tap/actions/workflows/tests.yml",
    }
  }
}) -->

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/mit)
[![brew test-bot](https://github.com/kitschpatrol/homebrew-tap/actions/workflows/tests.yml/badge.svg)](https://github.com/kitschpatrol/homebrew-tap/actions/workflows/tests.yml)

<!-- /badges -->

<!-- description -->

**Kitschpatrol's Homebrew Tap. Odds and ends.**

<!-- /description -->

## Overview

This is a collection of [Homebrew](https://brew.sh/) package definitions.

I maintain this tap for situations where:

- I'm publishing **my own first-party tools** that are too obscure to live in `homebrew/core`. ("First Party")

  _or..._

- There's **no official cask or formula available** for third-party software I want to manage through Homebrew. ("Third Party")

  _or..._

- I need a **specific pinned legacy version** of a third-party application for licensing, OS-compatibility, or other reasons. ("Pin")

  _or..._

- I'm maintaining **my own fork** of a third-party application that I want to manage through Homebrew. ("Fork")

  _or..._

- I want to **audit and maintain my own copy** of a third-party cask or formula from another third-party tap. ("Mirror")

## Usage

Trust the tap once before installing, including in unattended scripts:

```sh
brew trust kitschpatrol/tap
```

Then install a package:

`brew install kitschpatrol/tap/<formula>`

Or `brew tap kitschpatrol/tap` and then `brew install <formula>`.

For help, see `brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## Casks

<!-- casks -->

| Name                                                                              | Description                                                                | Cask                                                                    | Type        | Upstream Tap                                                                                                    |
| --------------------------------------------------------------------------------- | -------------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------- | --------------------------------------------------------------------------------------------------------------- |
| [A Better Finder Rename](https://www.publicspace.net/ABetterFinderRename/)        | Renamer for files, music and photos                                        | [a-better-finder-rename11](Casks/a-better-finder-rename11.rb)           | Pin         | —                                                                                                               |
| [Cadova Viewer](https://github.com/tomasf/CadovaViewer)                           | Viewer for 3MF 3D model files                                              | [cadova-viewer](Casks/cadova-viewer.rb)                                 | Third Party | —                                                                                                               |
| [DeskMat](https://eternalstorms.at/DeskMat/)                                      | Hide files and folders on your Desktop                                     | [deskmat](Casks/deskmat.rb)                                             | Third Party | —                                                                                                               |
| [Easy Complete](https://easy-complete.emmmm.dev/)                                 | IDE-style inline autocomplete for terminals                                | [easy-complete-mirror](Casks/easy-complete-mirror.rb)                   | Mirror      | [chen86860/tap/easy-complete](https://github.com/chen86860/homebrew-tap/blob/HEAD/Casks/easy-complete.rb)       |
| [FlashPrint](https://www.flashforge.com/pages/software-flashprint)                | Slicer and print controller for Flashforge 3D printers                     | [flashprint](Casks/flashprint.rb)                                       | Third Party | —                                                                                                               |
| [Gifski](https://sindresorhus.com/gifski)                                         | GUI for Gifski video to gif conversion library                             | [gifski-app](Casks/gifski-app.rb)                                       | Third Party | —                                                                                                               |
| [Gifski](https://sindresorhus.com/gifski)                                         | GUI for Gifski video to gif conversion library                             | [gifski-app223](Casks/gifski-app223.rb)                                 | Pin         | —                                                                                                               |
| [Hex](https://hex.kitlangton.com/)                                                | Local-first voice dictation                                                | [hex-mirror](Casks/hex-mirror.rb)                                       | Mirror      | [anomalyco/tap/hex](https://github.com/anomalyco/homebrew-tap/blob/HEAD/Casks/hex.rb)                           |
| [Keyhole](https://ikennd.ac/keyhole/)                                             | Choose which app responds to your media keys                               | [keyhole](Casks/keyhole.rb)                                             | Third Party | —                                                                                                               |
| [Lingon Pro](https://www.peterborgapps.com/lingon/)                               | Automator software to start apps, run scripts or commands and more         | [lingon-pro](Casks/lingon-pro.rb)                                       | Third Party | —                                                                                                               |
| [Lunacy](https://morphing.cloud/lunacy/)                                          | Play Lunatic Fringe, the classic After Dark space shooter                  | [lunacy-morphing](Casks/lunacy-morphing.rb)                             | Third Party | —                                                                                                               |
| [mac-os-7](https://mendelson.org/macos9osx.html)                                  | Classic Macintosh emulator via BasiliskII                                  | [mac-os-7](Casks/mac-os-7.rb)                                           | Third Party | —                                                                                                               |
| [mac-os-9](https://mendelson.org/macos9osx.html)                                  | Classic Macintosh emulator via SheepShaver                                 | [mac-os-9](Casks/mac-os-9.rb)                                           | Third Party | —                                                                                                               |
| [Machato](https://untimelyunicorn.gumroad.com/l/machato)                          | Native client for ChatGPT and other LLMs                                   | [machato](Casks/machato.rb)                                             | Third Party | —                                                                                                               |
| [Mail Archiver X](https://www.mothsoftware.com/content/content/mailarchiverx.php) | Archive your email                                                         | [mail-archiver-x](Casks/mail-archiver-x.rb)                             | Third Party | —                                                                                                               |
| [Marked Quick Look](https://markedapp.com/ql/)                                    | Quick Look previews for Markdown files with Marked-style rendering         | [marked-quick-look](Casks/marked-quick-look.rb)                         | Third Party | —                                                                                                               |
| [Math Reduce](https://github.com/kitschpatrol/math-reduce)                        | System-wide service to turn any text field into a calculator               | [math-reduce](Casks/math-reduce.rb)                                     | First Party | —                                                                                                               |
| [MAX Messages](https://www.mothsoftware.com/content/content/maxmessages.php)      | Archive your messages                                                      | [max-messages](Casks/max-messages.rb)                                   | Third Party | —                                                                                                               |
| [nurb](https://github.com/Shpigford/nurb)                                         | Agentic CAD tool for 3D printing                                           | [nurb](Casks/nurb.rb)                                                   | Third Party | —                                                                                                               |
| [OAK Viewer](https://docs.luxonis.com/software-v3/depthai/tools/oak-viewer/)      | Visualize output from Luxonis OAK cameras                                  | [oak-viewer](Casks/oak-viewer.rb)                                       | Third Party | —                                                                                                               |
| [Permute](https://software.charliemonroe.net/permute/)                            | Converts and edits video, audio or image files                             | [permute3148](Casks/permute3148.rb)                                     | Pin         | —                                                                                                               |
| [Photos Workbench](https://www.houdah.com/photosWorkbench/)                       | Organize, rate, and compare your photos                                    | [photos-workbench](Casks/photos-workbench.rb)                           | Third Party | —                                                                                                               |
| [Quick Look Doctor](https://markedapp.com/ql/doctor/)                             | Diagnose and resolve Quick Look preview handler conflicts                  | [quick-look-doctor](Casks/quick-look-doctor.rb)                         | Third Party | —                                                                                                               |
| [Rectangle](https://rectangleapp.com/)                                            | Move and resize windows using keyboard shortcuts or snap areas             | [rectangle-kitschpatrol](Casks/rectangle-kitschpatrol.rb)               | Fork        | —                                                                                                               |
| [Screen Studio](https://screen.studio/)                                           | Screen recorder and editor                                                 | [screen-studio3103397](Casks/screen-studio3103397.rb)                   | Pin         | —                                                                                                               |
| [Sensible Side Buttons](https://sensible-side-buttons.archagon.net/)              | Turns mouse side navigation buttons into swipe gestures on a per-app basis | [sensiblesidebuttons-desousak](Casks/sensiblesidebuttons-desousak.rb)   | Fork        | —                                                                                                               |
| [SF Mono Nerd Font](https://github.com/epk/SF-Mono-Nerd-Font)                     | Apple SF Mono patched with Nerd Font glyphs                                | [font-sf-mono-nerd-font-mirror](Casks/font-sf-mono-nerd-font-mirror.rb) | Mirror      | [epk/epk/font-sf-mono-nerd-font](https://github.com/epk/homebrew-epk/blob/HEAD/Casks/font-sf-mono-nerd-font.rb) |
| [SheepShaver](https://sheepshaver.cebix.net/)                                     | Classic Macintosh emulator                                                 | [sheepshaver](Casks/sheepshaver.rb)                                     | Third Party | —                                                                                                               |
| [Simple Color Palette](https://sindresorhus.com/simple-color-palette)             | View, create, and edit color palettes in the Simple Color Palette format   | [simple-color-palette](Casks/simple-color-palette.rb)                   | Third Party | —                                                                                                               |
| [Simple Color Palette](https://sindresorhus.com/simple-color-palette)             | View, create, and edit color palettes in the Simple Color Palette format   | [simple-color-palette120](Casks/simple-color-palette120.rb)             | Pin         | —                                                                                                               |
| [Sketch](https://www.sketch.com/)                                                 | Digital design and prototyping platform                                    | [sketch98](Casks/sketch98.rb)                                           | Pin         | —                                                                                                               |
| [Speediness](https://sindresorhus.com/speediness)                                 | Check your internet speed                                                  | [speediness](Casks/speediness.rb)                                       | Third Party | —                                                                                                               |
| [Speediness](https://sindresorhus.com/speediness)                                 | Check your internet speed                                                  | [speediness181](Casks/speediness181.rb)                                 | Pin         | —                                                                                                               |
| [Stacks](https://morphing.cloud/hypercard/)                                       | Run HyperCard stacks without an emulator                                   | [stacks](Casks/stacks.rb)                                               | Third Party | —                                                                                                               |
| [System Color Picker](https://sindresorhus.com/system-color-picker)               | Native system color picker as an app with more features                    | [system-color-picker](Casks/system-color-picker.rb)                     | Third Party | —                                                                                                               |
| [System Color Picker](https://sindresorhus.com/system-color-picker)               | Native system color picker as an app with more features                    | [system-color-picker214](Casks/system-color-picker214.rb)               | Pin         | —                                                                                                               |
| [Type Fu](https://type-fu.com/)                                                   | Vintage native version of the typing practice app                          | [type-fu](Casks/type-fu.rb)                                             | Third Party | —                                                                                                               |

<!-- /casks -->

## Formulas

<!-- formulas -->

| Name                                                                 | Description                                                                                                                              | Formula                                         | Type        | Upstream Tap                                                                                                    |
| -------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------- | ----------- | --------------------------------------------------------------------------------------------------------------- |
| [Aphex](https://github.com/kitschpatrol/aphex)                       | Apple Photos Export<br>(Also on [npm](https://www.npmjs.com/package/@kitschpatrol/aphex))                                                | [aphex](Formula/aphex.rb)                       | First Party | —                                                                                                               |
| [Brew File Mirror](https://github.com/rcmdnk/homebrew-file/)         | Brewfile manager for Homebrew                                                                                                            | [brew-file-mirror](Formula/brew-file-mirror.rb) | Mirror      | [rcmdnk/file/brew-file](https://github.com/rcmdnk/homebrew-file/blob/HEAD/brew-file.rb)                         |
| [Brewpub](https://github.com/kitschpatrol/brewpub)                   | Publish and update Homebrew formula to your custom tap<br>(Also on [npm](https://www.npmjs.com/package/brewpub))                         | [brewpub](Formula/brewpub.rb)                   | First Party | —                                                                                                               |
| [Es Check Min](https://github.com/kitschpatrol/es-check-min)         | Find the minimum compatible ECMAScript version of a JavaScript file<br>(Also on [npm](https://www.npmjs.com/package/es-check-min))       | [es-check-min](Formula/es-check-min.rb)         | Unknown     | —                                                                                                               |
| [Itson](https://github.com/kitschpatrol/itson)                       | Configuration-driven management of long-running interactive applications<br>(Also on [npm](https://www.npmjs.com/package/itson))         | [itson](Formula/itson.rb)                       | First Party | —                                                                                                               |
| [Mdat](https://github.com/kitschpatrol/mdat)                         | Turn comments into content in Markdown files<br>(Also on [npm](https://www.npmjs.com/package/mdat))                                      | [mdat](Formula/mdat.rb)                         | First Party | —                                                                                                               |
| [Metascope](https://github.com/kitschpatrol/metascope)               | Easily extract metadata from all kinds of software repositories<br>(Also on [npm](https://www.npmjs.com/package/metascope))              | [metascope](Formula/metascope.rb)               | First Party | —                                                                                                               |
| [Oakctl](https://docs.luxonis.com/software-v3/oak-apps/oakctl)       | Manage Luxonis OAK cameras                                                                                                               | [oakctl](Formula/oakctl.rb)                     | Third Party | —                                                                                                               |
| [Osxphotos Mirror](https://github.com/RhetTbull/osxphotos)           | Export photos from Apple Photos app and query the Photos database                                                                        | [osxphotos-mirror](Formula/osxphotos-mirror.rb) | Mirror      | [rhettbull/osxphotos/osxphotos](https://github.com/rhettbull/homebrew-osxphotos/blob/HEAD/Formula/osxphotos.rb) |
| [Pixex](https://github.com/kitschpatrol/pixex)                       | Pixelmator Export<br>(Also on [npm](https://www.npmjs.com/package/pixex))                                                                | [pixex](Formula/pixex.rb)                       | First Party | —                                                                                                               |
| [Poptab](https://github.com/kitschpatrol/poptab)                     | Clean up specific browser tabs<br>(Also on [npm](https://www.npmjs.com/package/poptab))                                                  | [poptab](Formula/poptab.rb)                     | First Party | —                                                                                                               |
| [Renami](https://github.com/kitschpatrol/renami)                     | Config-driven and content-aware automatic filename management<br>(Also on [npm](https://www.npmjs.com/package/@kitschpatrol/renami))     | [renami](Formula/renami.rb)                     | First Party | —                                                                                                               |
| [Snip](https://github.com/kitschpatrol/snip)                         | Snippet management<br>(Also on [npm](https://www.npmjs.com/package/@kitschpatrol/snip))                                                  | [snip](Formula/snip.rb)                         | First Party | —                                                                                                               |
| [Starlight To PDF](https://github.com/kitschpatrol/starlight-to-pdf) | Convert Starlight documentation websites into PDF files<br>(Also on [npm](https://www.npmjs.com/package/@kitschpatrol/starlight-to-pdf)) | [starlight-to-pdf](Formula/starlight-to-pdf.rb) | First Party | —                                                                                                               |
| [Sv](https://svelte.dev/docs/cli)                                    | CLI for creating and maintaining Svelte applications<br>(Also on [npm](https://www.npmjs.com/package/sv))                                | [sv](Formula/sv.rb)                             | Third Party | —                                                                                                               |
| [Terraform Mirror](https://www.terraform.io/)                        | Terraform                                                                                                                                | [terraform-mirror](Formula/terraform-mirror.rb) | Mirror      | [hashicorp/tap/terraform](https://github.com/hashicorp/homebrew-tap/blob/HEAD/Formula/terraform.rb)             |
| [Tldraw CLI](https://github.com/kitschpatrol/tldraw-cli)             | Exporting tldraw sketches to PNG or SVG images<br>(Also on [npm](https://www.npmjs.com/package/@kitschpatrol/tldraw-cli))                | [tldraw-cli](Formula/tldraw-cli.rb)             | First Party | —                                                                                                               |
| [Tsx](https://tsx.hirok.io)                                          | Node.js enhanced with esbuild to run TypeScript and ESM files<br>(Also on [npm](https://www.npmjs.com/package/tsx))                      | [tsx](Formula/tsx.rb)                           | Third Party | —                                                                                                               |
| [Vidup](https://github.com/kitschpatrol/vidup)                       | Synchronize a local directory of video files to remote streaming services<br>(Also on [npm](https://www.npmjs.com/package/vidup))        | [vidup](Formula/vidup.rb)                       | First Party | —                                                                                                               |
| [Yanki](https://github.com/kitschpatrol/yanki)                       | Turn Markdown into Anki flashcards<br>(Also on [npm](https://www.npmjs.com/package/yanki))                                               | [yanki](Formula/yanki.rb)                       | First Party | —                                                                                                               |

<!-- /formulas -->

## Migrated

<!-- migrated -->

| Name                                           | Description                                            | Cask / Formula                                         | Migrated to Tap                                            | Date       |
| ---------------------------------------------- | ------------------------------------------------------ | ------------------------------------------------------ | ---------------------------------------------------------- | ---------- |
| [Afterglow](https://morphing.cloud/afterglow/) | Classic After Dark screen savers emulator              | [afterglow](https://formulae.brew.sh/cask/afterglow)   | [homebrew/cask](https://github.com/homebrew/homebrew-cask) | 2026-09-15 |
| [Msedit](https://github.com/microsoft/edit)    | Simple text editor with clickable interface            | [msedit](https://formulae.brew.sh/formula/msedit)      | [homebrew/core](https://github.com/homebrew/homebrew-core) | 2026-05-13 |
| [Plasticity](https://www.plasticity.xyz/)      | 3D modeling software for concept artists and designers | [plasticity](https://formulae.brew.sh/cask/plasticity) | [homebrew/cask](https://github.com/homebrew/homebrew-cask) | 2026-09-15 |

<!-- /migrated -->

## Implementation notes

### Why not submit these to `homebrew/cask`?

It might be nice to submit some of these upstream, but these packages are primarily maintained for my own use and may not meet [Homebrew's eligibility requirements](https://docs.brew.sh/Acceptable-Casks) for inclusion in the official tap repository.

Anyone (particularly the original application developer) is welcome to grab anything from this repo and try to shephard it into [`homebrew/cask`](https://github.com/Homebrew/homebrew-cask), but I just don't have the time at the moment. Anything that makes it in upstream will be marked as migrated in this tap.

### Repository structure

Originally based on [`brew tap-new`](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap).

- [`Casks/`](Casks/) contains cask definitions in a flat directory.
- [`Formula/`](Formula/) contains formula definitions in a flat directory.
- [`tap_metadata.json`](tap_metadata.json) records package types, upstream taps and mirror update strategies independently of their file locations.
- [`tap_migrations.json`](tap_migrations.json) records packages moved to other taps.

### Package types

The cask and formula tables use the same types:

| Type        | Metadata value | Meaning                                                                  |
| ----------- | -------------- | ------------------------------------------------------------------------ |
| First Party | `first-party`  | Original software I develop and publish through this tap                 |
| Third Party | `third-party`  | Software by other developers for which I maintain the packaging here     |
| Fork        | `fork`         | A modified version of another developer's software                       |
| Mirror      | `mirror`       | Packaging adopted from another tap, audited and maintained independently |
| Pin         | `pin`          | A specific older version retained for licensing or compatibility         |
| Unknown     | —              | No type recorded in the metadata                                         |

Fork, Mirror, and Pin take precedence over the general First Party and Third Party labels when they describe why a package is maintained here. Mirror definitions link to their source in a comment and may diverge from upstream.

Metadata entries use `cask/<token>` or `formula/<name>` keys so casks and formulae can share a name without sharing metadata. For example:

```json
{
  "cask/deskmat": { "type": "third-party" },
  "formula/metascope": { "type": "first-party" }
}
```

The README generator displays **Unknown** when an entry or its `type` is missing. Adding a package does not require adding metadata immediately.

Mirrors also record `upstreamTap`, `upstreamName` and `upstreamPath`. The generated tables link directly to the upstream definitions. For example:

```json
{
  "cask/easy-complete-mirror": {
    "type": "mirror",
    "upstreamTap": "chen86860/tap",
    "upstreamName": "easy-complete",
    "upstreamPath": "Casks/easy-complete.rb"
  }
}
```

The daily formula and cask workflows open update PRs for review. They do not merge PRs or write to `main`. Most packages use livecheck and the existing bump actions. EPK's font uses a custom regex to preserve its complete alphanumeric version tag; Brew-file checks Git tags rather than GitHub releases. Additional checks make these mirror jobs fail visibly when release detection fails. After package changes reach `main`, the README workflow regenerates the tables and commits the README directly, including after brewpub pushes.

Terraform and OSXPhotos set `updateStrategy` to `upstream`. The formula workflow fetches their complete recipes through the GitHub API without tapping their source taps. It applies the local adaptations in [`scripts/mirrors/`](scripts/mirrors/) and opens or updates a single PR. This retains every Terraform platform URL and checksum, and OSXPhotos' Python dependency and installation changes. If upstream changes make a local patch incompatible, the sync fails before writing any recipes. These two formulae skip generic livecheck bumping.

Preview recipe synchronization locally with `pnpm sync-mirrors`; add `--write` to update the local files. Run `pnpm run test:1-mirrors` to check the adaptations against simulated upstream changes. When maintaining an adaptation, update its patch and fixture together. Source comments and upstream metadata identify the original packaging; mirrors may retain local fixes.

### Tap precedence

There [doesn't seem to be a good way](https://github.com/Homebrew/legacy-homebrew/issues/24238) to prefer one tap's formulae or casks over another's, so formulae and casks in the Pin category are given unique names.

### Taking sha256

```sh
shasum -a 256 ./YourApp.zip | sed 's/ .*//' | pbcopy
```

### Checking for cask updates

```sh
brew bump --tap kitschpatrol/tap
```

### Testing livecheck

For automated cask updates. Used by [github-action-homebrew-bump-cask](https://github.com/kitschpatrol/github-action-homebrew-bump-cask).

```sh
brew developer on
brew livecheck --cask --quiet --full-name --json --tap=kitschpatrol/tap
echo $?
brew developer off
```

To check the "latest" version returned by an individual cask:

```sh
brew livecheck --debug --cask ./path/to/cask.rb
```

Alternate livecheck approach, downloads and scrapes version from plist:

```ruby
livecheck do
  url :url
  strategy :extract_plist do |items|
    items["org.wpdos.Mac-OS-9"].short_version
  end
end
```

Alternate livecheck approach, coat-tailing on MacUpdater's database:

```ruby
livecheck do
  url "https://macupdater.net/app_updates/appinfo/org.wpdos.Mac-OS-9/index.html"
  regex(%r{Version String:</td>\s*<td>(\d{4}\.\d{2}\.\d{2})}ni)
end
```

### Publishing npm packages with brewpub

Some packages in this tap are also published to npm, so you can install them through either package manager. The Homebrew versions of these packages _only_ expose the CLI interface for the tool, so if you're working directly in a node or TypeScript project, installing via npm is recommended for access to library APIs.

I use [brewpub](https://github.com/kitschpatrol/brewpub) to automatically generate and publish Homebrew formulae for my npm packages

## Known issues

The following casks use hardcoded Dropbox download URLs that contain unpredictable hashes and must be updated manually when a new version is released (livecheck will detect new versions, but the URL must be fetched from the app's homepage manually):

- [System Color Picker](https://sindresorhus.com/system-color-picker)
- [Simple Color Palette](https://sindresorhus.com/simple-color-palette)
- [Speediness](https://sindresorhus.com/speediness)
- [Gifski](https://github.com/sindresorhus/Gifski) (Has the same issue, but its download URL is hosted on GitHub.)

<!-- license -->

## License

[MIT](license.txt) © [Eric Mika](https://ericmika.com)

<!-- /license -->
