<!--+ Warning: Content inside HTML comment blocks was generated by mdat and may be overwritten. +-->

# kitschpatrol/tap

<!-- badges -->

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

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

| Application                                                                | Description                                                                | Cask                                                                       | Type   |
| -------------------------------------------------------------------------- | -------------------------------------------------------------------------- | -------------------------------------------------------------------------- | ------ |
| [A Better Finder Rename](https://www.publicspace.net/ABetterFinderRename/) | Renamer for files, music and photos                                        | [a-better-finder-rename11](Casks/pinned/a-better-finder-rename11.rb)       | Pinned |
| [Acorn](https://flyingmeat.com/acorn/)                                     | Image editor focused on simplicity                                         | [acorn8](Casks/custom/acorn8.rb)                                           | Custom |
| [FlashPrint](https://enterprise.flashforge.com/pages/flashprint)           | Slicer and print controller for Flashforge 3D printers                     | [flashprint](Casks/custom/flashprint.rb)                                   | Custom |
| [Gifski](https://gif.ski/)                                                 | GUI for Gifski video to gif conversion library                             | [gifski](Casks/custom/gifski.rb)                                           | Custom |
| [mac-os-7](https://mendelson.org/macos9osx.html)                           | Classic Macintosh emulator via BasiliskII                                  | [mac-os-7](Casks/custom/mac-os-7.rb)                                       | Custom |
| [mac-os-9](https://mendelson.org/macos9osx.html)                           | Classic Macintosh emulator via SheepShaver                                 | [mac-os-9](Casks/custom/mac-os-9.rb)                                       | Custom |
| [Machato](https://machato.app/)                                            | Native client for ChatGPT and other LLMs                                   | [machato](Casks/custom/machato.rb)                                         | Custom |
| [Mail Archiver X](https://www.mothsoftware.com/)                           | Archive your email                                                         | [mail-archiver-x](Casks/custom/mail-archiver-x.rb)                         | Custom |
| [Photos Workbench](https://www.houdah.com/photosWorkbench/)                | Organize, rate, and compare your photos                                    | [photos-workbench](Casks/custom/photos-workbench.rb)                       | Custom |
| [Plasticity](https://www.plasticity.xyz/)                                  | 3D solid and surface modeling                                              | [plasticity](Casks/custom/plasticity.rb)                                   | Custom |
| [Rectangle](https://rectangleapp.com/)                                     | Move and resize windows using keyboard shortcuts or snap areas             | [rectangle-kitschpatrol](Casks/fork/rectangle-kitschpatrol.rb)             | Fork   |
| [Sensible Side Buttons](https://sensible-side-buttons.archagon.net/)       | Turns mouse side navigation buttons into swipe gestures on a per-app basis | [sensiblesidebuttons-desousak](Casks/fork/sensiblesidebuttons-desousak.rb) | Fork   |
| [SheepShaver](http://sheepshaver.cebix.net/)                               | Classic Macintosh emulator                                                 | [sheepshaver](Casks/custom/sheepshaver.rb)                                 | Custom |
| [Sketch](https://www.sketch.com/)                                          | Digital design and prototyping platform                                    | [sketch98](Casks/pinned/sketch98.rb)                                       | Pinned |
| [Speediness](https://sindresorhus.com/speediness)                          | Check your internet speed                                                  | [speediness](Casks/custom/speediness.rb)                                   | Custom |
| [Type Fu](https://type-fu.com/)                                            | Vintage native version of the typing practice app                          | [type-fu](Casks/custom/type-fu.rb)                                         | Custom |

<!-- /casks -->

## Implementation notes

### Repository structure

Originally based on [`brew tap-new`](https://github.com/Homebrew/brew/blob/master/docs/How-to-Create-and-Maintain-a-Tap.md).

`Casks/custom` - Casks or cask versions not available elsewhere

`Casks/fork` - Forks of casks otherwise available in [`homebrew/core`](https://github.com/Homebrew/homebrew-core)

`Casks/pinned` - Legacy casks formerly available in [`homebrew/core`](https://github.com/Homebrew/homebrew-core)

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

<!-- license -->

## License

[MIT](license.txt) © Eric Mika

<!-- /license -->
