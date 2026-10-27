cask "mac-os-9" do
  version "2026.07.25"
  sha256 "e4bd975519e5a00101c89c66ed630c489f7ef7320588bffb41d1264ffff3624f"

  # Version at end of the url works around Homebrew's
  # insistence on skipping checksums on unversioned URLs.
  url "https://mendelson.org/Mac%20OS%209.zip##{version}"
  name "mac-os-9"
  desc "Classic Macintosh emulator via SheepShaver"
  homepage "https://mendelson.org/macos9osx.html"

  livecheck do
    url :url
    strategy :extract_plist do |items|
      items["org.wpdos.Mac-OS-9"].short_version
    end
  end

  depends_on :macos

  app "Mac OS 9.app"
end
