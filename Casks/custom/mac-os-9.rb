cask "mac-os-9" do
  version "2025.02.01"
  sha256 "bfe445f2cf0c475e58130f6cb68583b211dfb3f0ae254e4c68041671298cf83b"

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
