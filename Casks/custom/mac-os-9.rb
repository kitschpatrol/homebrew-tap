cask "mac-os-9" do
  version "2024.09.16"
  sha256 "15968d3cf2c7a9f9679d28443cf0f75ecd7041bf2e17f7598c7f56a4f277d38c"

  # Version at end of the url works around Homebrew's
  # insistence on skipping checksums on unversioned URLs.
  url "https://mendelson.org/Mac%20OS%209.zip##{version}"
  name "mac-os-9"
  desc "Classic Macintosh emulator via SheepShaver"
  homepage "https://mendelson.org/macos9osx.html"

  livecheck do
    url "https://macupdater.net/app_updates/appinfo/org.wpdos.Mac-OS-9/index.html"
    regex(%r{Version String:</td>\s*<td>(\d{4}\.\d{2}\.\d{2})}ni)
  end

  app "Mac OS 9.app"
end
