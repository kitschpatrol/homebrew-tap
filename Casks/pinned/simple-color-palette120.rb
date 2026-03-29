cask "simple-color-palette120" do
  version "1.2.0"
  sha256 "dfd603eb528514c462220b3ef74e840bed9034e50d87f505a6d68a3b917265c2"

  # Version at end of the url works around Homebrew's
  # insistence on skipping checksums on unversioned URLs.
  url "https://www.dropbox.com/scl/fi/pn0p37paa3no0izdnmo0g/Simple-Color-Palette-1.2.0-macOS-15-1772815829.zip?rlkey=lnt9co9xdb2b9n6bn9rao9pux&raw=1##{version}",
      verified: "dropbox.com/"
  name "Simple Color Palette"
  desc "View, create, and edit color palettes in the Simple Color Palette format"
  homepage "https://sindresorhus.com/simple-color-palette"

  livecheck do
    skip "Pinned version"
  end

  depends_on macos: ">= :sequoia"

  app "Simple Color Palette.app"
end
