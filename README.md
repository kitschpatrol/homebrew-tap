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

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/mit/)
[![brew test-bot](https://github.com/kitschpatrol/homebrew-tap/actions/workflows/tests.yml/badge.svg)](https://github.com/kitschpatrol/homebrew-tap/actions/workflows/tests.yml)

<!-- /badges -->

<!-- description -->

**Kitschpatrol's Homebrew Tap. Odds and ends.**

<!-- /description -->

## Usage

`brew install kitschpatrol/tap/<formula>`

Or `brew tap kitschpatrol/tap` and then `brew install <formula>`.

For help, see `brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## Casks

<!-- casks -->

| Name                                                                              | Description                                                                | Cask                                                                       | Type   |
| --------------------------------------------------------------------------------- | -------------------------------------------------------------------------- | -------------------------------------------------------------------------- | ------ |
| [A Better Finder Rename](https://www.publicspace.net/ABetterFinderRename/)        | Renamer for files, music and photos                                        | [a-better-finder-rename11](Casks/pinned/a-better-finder-rename11.rb)       | Pinned |
| [FlashPrint](https://enterprise.flashforge.com/pages/flashprint)                  | Slicer and print controller for Flashforge 3D printers                     | [flashprint](Casks/custom/flashprint.rb)                                   | Custom |
| [Gifski](https://sindresorhus.com/gifski)                                         | GUI for Gifski video to gif conversion library                             | [gifski-app223](Casks/pinned/gifski-app223.rb)                             | Pinned |
| [Gifski](https://sindresorhus.com/gifski)                                         | GUI for Gifski video to gif conversion library                             | [gifski-app](Casks/custom/gifski-app.rb)                                   | Custom |
| [Lingon Pro](https://www.peterborgapps.com/lingon/)                               | Automator software to start apps, run scripts or commands and more         | [lingon-pro](Casks/custom/lingon-pro.rb)                                   | Custom |
| [mac-os-7](https://mendelson.org/macos9osx.html)                                  | Classic Macintosh emulator via BasiliskII                                  | [mac-os-7](Casks/custom/mac-os-7.rb)                                       | Custom |
| [mac-os-9](https://mendelson.org/macos9osx.html)                                  | Classic Macintosh emulator via SheepShaver                                 | [mac-os-9](Casks/custom/mac-os-9.rb)                                       | Custom |
| [Machato](https://machato.app/)                                                   | Native client for ChatGPT and other LLMs                                   | [machato](Casks/custom/machato.rb)                                         | Custom |
| [Mail Archiver X](https://www.mothsoftware.com/content/content/mailarchiverx.php) | Archive your email                                                         | [mail-archiver-x](Casks/custom/mail-archiver-x.rb)                         | Custom |
| [MAX Messages](https://www.mothsoftware.com/content/content/maxmessages.php)      | Archive your messages                                                      | [max-messages](Casks/custom/max-messages.rb)                               | Custom |
| [Photos Workbench](https://www.houdah.com/photosWorkbench/)                       | Organize, rate, and compare your photos                                    | [photos-workbench](Casks/custom/photos-workbench.rb)                       | Custom |
| [Plasticity](https://www.plasticity.xyz/)                                         | 3D solid and surface modeling                                              | [plasticity](Casks/custom/plasticity.rb)                                   | Custom |
| [Rectangle](https://rectangleapp.com/)                                            | Move and resize windows using keyboard shortcuts or snap areas             | [rectangle-kitschpatrol](Casks/fork/rectangle-kitschpatrol.rb)             | Fork   |
| [Sensible Side Buttons](https://sensible-side-buttons.archagon.net/)              | Turns mouse side navigation buttons into swipe gestures on a per-app basis | [sensiblesidebuttons-desousak](Casks/fork/sensiblesidebuttons-desousak.rb) | Fork   |
| [SheepShaver](http://sheepshaver.cebix.net/)                                      | Classic Macintosh emulator                                                 | [sheepshaver](Casks/custom/sheepshaver.rb)                                 | Custom |
| [Simple Color Palette](https://sindresorhus.com/simple-color-palette)             | View, create, and edit color palettes in the Simple Color Palette format   | [simple-color-palette120](Casks/pinned/simple-color-palette120.rb)         | Pinned |
| [Simple Color Palette](https://sindresorhus.com/simple-color-palette)             | View, create, and edit color palettes in the Simple Color Palette format   | [simple-color-palette](Casks/custom/simple-color-palette.rb)               | Custom |
| [Sketch](https://www.sketch.com/)                                                 | Digital design and prototyping platform                                    | [sketch98](Casks/pinned/sketch98.rb)                                       | Pinned |
| [Speediness](https://sindresorhus.com/speediness)                                 | Check your internet speed                                                  | [speediness181](Casks/pinned/speediness181.rb)                             | Pinned |
| [Speediness](https://sindresorhus.com/speediness)                                 | Check your internet speed                                                  | [speediness](Casks/custom/speediness.rb)                                   | Custom |
| [System Color Picker](https://sindresorhus.com/system-color-picker)               | Native system color picker as an app with more features                    | [system-color-picker214](Casks/pinned/system-color-picker214.rb)           | Pinned |
| [System Color Picker](https://sindresorhus.com/system-color-picker)               | Native system color picker as an app with more features                    | [system-color-picker](Casks/custom/system-color-picker.rb)                 | Custom |
| [Type Fu](https://type-fu.com/)                                                   | Vintage native version of the typing practice app                          | [type-fu](Casks/custom/type-fu.rb)                                         | Custom |

<!-- /casks -->

## Formulas

<!-- formulas -->

| Name                                        | Description                                 | Formula                            | Type   |
| ------------------------------------------- | ------------------------------------------- | ---------------------------------- | ------ |
| [Msedit](https://github.com/microsoft/edit) | Simple text editor with clickable interface | [msedit](Formula/custom/msedit.rb) | Custom |

<!-- /formulas -->

## Implementation notes

### Repository structure

Originally based on [`brew tap-new`](https://github.com/Homebrew/brew/blob/master/docs/How-to-Create-and-Maintain-a-Tap.md).

`Casks/custom` - Casks or cask versions not available elsewhere

`Casks/fork` - Forks of casks otherwise available in [`homebrew/homebrew-cask`](https://github.com/Homebrew/homebrew-cask)

`Casks/pinned` - Legacy casks formerly available in [`homebrew/homebrew-cask`](https://github.com/Homebrew/homebrew-cask)

`Formula/custom` - Formulae not available elsewhere

`Formula/fork` - Forks of formulae otherwise available in [`homebrew/homebrew-core`](https://github.com/Homebrew/homebrew-core) _(None yet...)_

`Formula/pinned` - Legacy formulae formerly available in [`homebrew/homebrew-core`](https://github.com/Homebrew/homebrew-core) _(None yet...)_

### Tap precedence

There [doesn't seem to be a good way](https://github.com/Homebrew/legacy-homebrew/issues/24238) to prefer one tap's formulae or casks over another's, so the "pinned" formulae / casks are given unique names.

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

(But why is <https://www.macupdater.net/app_updates/appinfo/org.wpdos.system761> 404ing?)

## Known issues

The following casks use hardcoded Dropbox download URLs that contain unpredictable hashes and must be updated manually when a new version is released (livecheck will detect new versions, but the URL must be fetched from the app's homepage manually):

- [System Color Picker](https://sindresorhus.com/system-color-picker)
- [Simple Color Palette](https://sindresorhus.com/simple-color-palette)
- [Speediness](https://sindresorhus.com/speediness)
- [Gifski](https://github.com/sindresorhus/Gifski) (Has the same issue, but its download URL is hosted on GitHub.)

## Cask candidates

Apps that aren't yet available as casks:

- [ ] [DeskMat](https://eternalstorms.at/DeskMat/)

<!-- license -->

## License

[MIT](license.txt) © [Eric Mika](https://ericmika.com)

<!-- /license -->
