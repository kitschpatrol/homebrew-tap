# kitschpatrol/tap

<!-- badges({
  npm: [],
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

| Name                                                                              | Description                                                                | Cask                                                                  | Type        |
| --------------------------------------------------------------------------------- | -------------------------------------------------------------------------- | --------------------------------------------------------------------- | ----------- |
| [A Better Finder Rename](https://www.publicspace.net/ABetterFinderRename/)        | Renamer for files, music and photos                                        | [a-better-finder-rename11](Casks/a-better-finder-rename11.rb)         | Pin         |
| [Cadova Viewer](https://github.com/tomasf/CadovaViewer)                           | Viewer for 3MF 3D model files                                              | [cadova-viewer](Casks/cadova-viewer.rb)                               | Third Party |
| [DeskMat](https://eternalstorms.at/DeskMat/)                                      | Hide files and folders on your Desktop                                     | [deskmat](Casks/deskmat.rb)                                           | Third Party |
| [Easy Complete](https://easy-complete.emmmm.dev/)                                 | IDE-style inline autocomplete for terminals                                | [easy-complete-mirror](Casks/easy-complete-mirror.rb)                 | Mirror      |
| [FlashPrint](https://www.flashforge.com/pages/software-flashprint)                | Slicer and print controller for Flashforge 3D printers                     | [flashprint](Casks/flashprint.rb)                                     | Third Party |
| [Gifski](https://sindresorhus.com/gifski)                                         | GUI for Gifski video to gif conversion library                             | [gifski-app](Casks/gifski-app.rb)                                     | Third Party |
| [Gifski](https://sindresorhus.com/gifski)                                         | GUI for Gifski video to gif conversion library                             | [gifski-app223](Casks/gifski-app223.rb)                               | Pin         |
| [Keyhole](https://ikennd.ac/keyhole/)                                             | Choose which app responds to your media keys                               | [keyhole](Casks/keyhole.rb)                                           | Third Party |
| [Lingon Pro](https://www.peterborgapps.com/lingon/)                               | Automator software to start apps, run scripts or commands and more         | [lingon-pro](Casks/lingon-pro.rb)                                     | Third Party |
| [Lunacy](https://morphing.cloud/lunacy/)                                          | Play Lunatic Fringe, the classic After Dark space shooter                  | [lunacy-morphing](Casks/lunacy-morphing.rb)                           | Third Party |
| [mac-os-7](https://mendelson.org/macos9osx.html)                                  | Classic Macintosh emulator via BasiliskII                                  | [mac-os-7](Casks/mac-os-7.rb)                                         | Third Party |
| [mac-os-9](https://mendelson.org/macos9osx.html)                                  | Classic Macintosh emulator via SheepShaver                                 | [mac-os-9](Casks/mac-os-9.rb)                                         | Third Party |
| [Machato](https://untimelyunicorn.gumroad.com/l/machato)                          | Native client for ChatGPT and other LLMs                                   | [machato](Casks/machato.rb)                                           | Third Party |
| [Mail Archiver X](https://www.mothsoftware.com/content/content/mailarchiverx.php) | Archive your email                                                         | [mail-archiver-x](Casks/mail-archiver-x.rb)                           | Third Party |
| [Marked Quick Look](https://markedapp.com/ql/)                                    | Quick Look previews for Markdown files with Marked-style rendering         | [marked-quick-look](Casks/marked-quick-look.rb)                       | Third Party |
| [MAX Messages](https://www.mothsoftware.com/content/content/maxmessages.php)      | Archive your messages                                                      | [max-messages](Casks/max-messages.rb)                                 | Third Party |
| [nurb](https://github.com/Shpigford/nurb)                                         | Agentic CAD tool for 3D printing                                           | [nurb](Casks/nurb.rb)                                                 | Third Party |
| [OAK Viewer](https://docs.luxonis.com/software-v3/depthai/tools/oak-viewer/)      | Visualize output from Luxonis OAK cameras                                  | [oak-viewer](Casks/oak-viewer.rb)                                     | Third Party |
| [Permute](https://software.charliemonroe.net/permute/)                            | Converts and edits video, audio or image files                             | [permute3148](Casks/permute3148.rb)                                   | Pin         |
| [Photos Workbench](https://www.houdah.com/photosWorkbench/)                       | Organize, rate, and compare your photos                                    | [photos-workbench](Casks/photos-workbench.rb)                         | Third Party |
| [Quick Look Doctor](https://markedapp.com/ql/doctor/)                             | Diagnose and resolve Quick Look preview handler conflicts                  | [quick-look-doctor](Casks/quick-look-doctor.rb)                       | Third Party |
| [Rectangle](https://rectangleapp.com/)                                            | Move and resize windows using keyboard shortcuts or snap areas             | [rectangle-kitschpatrol](Casks/rectangle-kitschpatrol.rb)             | Fork        |
| [Screen Studio](https://screen.studio/)                                           | Screen recorder and editor                                                 | [screen-studio3103397](Casks/screen-studio3103397.rb)                 | Pin         |
| [Sensible Side Buttons](https://sensible-side-buttons.archagon.net/)              | Turns mouse side navigation buttons into swipe gestures on a per-app basis | [sensiblesidebuttons-desousak](Casks/sensiblesidebuttons-desousak.rb) | Fork        |
| [SheepShaver](https://sheepshaver.cebix.net/)                                     | Classic Macintosh emulator                                                 | [sheepshaver](Casks/sheepshaver.rb)                                   | Third Party |
| [Simple Color Palette](https://sindresorhus.com/simple-color-palette)             | View, create, and edit color palettes in the Simple Color Palette format   | [simple-color-palette](Casks/simple-color-palette.rb)                 | Third Party |
| [Simple Color Palette](https://sindresorhus.com/simple-color-palette)             | View, create, and edit color palettes in the Simple Color Palette format   | [simple-color-palette120](Casks/simple-color-palette120.rb)           | Pin         |
| [Sketch](https://www.sketch.com/)                                                 | Digital design and prototyping platform                                    | [sketch98](Casks/sketch98.rb)                                         | Pin         |
| [Speediness](https://sindresorhus.com/speediness)                                 | Check your internet speed                                                  | [speediness](Casks/speediness.rb)                                     | Third Party |
| [Speediness](https://sindresorhus.com/speediness)                                 | Check your internet speed                                                  | [speediness181](Casks/speediness181.rb)                               | Pin         |
| [Stacks](https://morphing.cloud/hypercard/)                                       | Run HyperCard stacks without an emulator                                   | [stacks](Casks/stacks.rb)                                             | Third Party |
| [System Color Picker](https://sindresorhus.com/system-color-picker)               | Native system color picker as an app with more features                    | [system-color-picker](Casks/system-color-picker.rb)                   | Third Party |
| [System Color Picker](https://sindresorhus.com/system-color-picker)               | Native system color picker as an app with more features                    | [system-color-picker214](Casks/system-color-picker214.rb)             | Pin         |
| [Type Fu](https://type-fu.com/)                                                   | Vintage native version of the typing practice app                          | [type-fu](Casks/type-fu.rb)                                           | Third Party |

<!-- /casks -->

## Formulas

<!-- formulas -->

| Name                                                                 | Description                                                                                                                           | Formula                                         | Type        |
| -------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------- | ----------- |
| [Aphex](https://github.com/kitschpatrol/aphex)                       | Apple Photos Export (Also on [npm](https://www.npmjs.com/package/@kitschpatrol/aphex))                                                | [aphex](Formula/aphex.rb)                       | Unknown     |
| [Brewpub](https://github.com/kitschpatrol/brewpub)                   | Publish and update Homebrew formula to your custom tap (Also on [npm](https://www.npmjs.com/package/brewpub))                         | [brewpub](Formula/brewpub.rb)                   | Unknown     |
| [Itson](https://github.com/kitschpatrol/itson)                       | Configuration-driven management of long-running interactive applications (Also on [npm](https://www.npmjs.com/package/itson))         | [itson](Formula/itson.rb)                       | First Party |
| [Mdat](https://github.com/kitschpatrol/mdat)                         | Markdown Autophagic Template (MDAT) system (Also on [npm](https://www.npmjs.com/package/mdat))                                        | [mdat](Formula/mdat.rb)                         | Unknown     |
| [Metascope](https://github.com/kitschpatrol/metascope)               | Easily extract metadata from all kinds of software repositories (Also on [npm](https://www.npmjs.com/package/metascope))              | [metascope](Formula/metascope.rb)               | First Party |
| [Oakctl](https://docs.luxonis.com/software-v3/oak-apps/oakctl)       | Command-line tool for managing Luxonis OAK cameras                                                                                    | [oakctl](Formula/oakctl.rb)                     | Third Party |
| [Renami](https://github.com/kitschpatrol/renami)                     | Config-driven and content-aware automatic filename management (Also on [npm](https://www.npmjs.com/package/@kitschpatrol/renami))     | [renami](Formula/renami.rb)                     | Unknown     |
| [Snip](https://github.com/kitschpatrol/snip)                         | Snippet management (Also on [npm](https://www.npmjs.com/package/@kitschpatrol/snip))                                                  | [snip](Formula/snip.rb)                         | Unknown     |
| [Starlight To Pdf](https://github.com/kitschpatrol/starlight-to-pdf) | Convert Starlight documentation websites into PDF files (Also on [npm](https://www.npmjs.com/package/@kitschpatrol/starlight-to-pdf)) | [starlight-to-pdf](Formula/starlight-to-pdf.rb) | Unknown     |
| [Tldraw Cli](https://github.com/kitschpatrol/tldraw-cli)             | Exporting tldraw sketches to PNG or SVG images (Also on [npm](https://www.npmjs.com/package/@kitschpatrol/tldraw-cli))                | [tldraw-cli](Formula/tldraw-cli.rb)             | Unknown     |
| [Vidup](https://github.com/kitschpatrol/vidup)                       | Synchronize a local directory of video files to remote streaming services (Also on [npm](https://www.npmjs.com/package/vidup))        | [vidup](Formula/vidup.rb)                       | Unknown     |

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
- [`tap-metadata.json`](tap-metadata.json) records package types independently of their file locations.
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

### Tap precedence

There [doesn't seem to be a good way](https://github.com/Homebrew/legacy-homebrew/issues/24238) to prefer one tap's formulae or casks over another's, so formulae and casks in the Pin category are given unique names.

Mirror casks retain the `-mirror` suffix to distinguish this tap's packaging from the source tap's casks:

```sh
brew install --cask kitschpatrol/tap/easy-complete-mirror
```

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
