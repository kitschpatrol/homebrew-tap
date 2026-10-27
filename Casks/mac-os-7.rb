cask "mac-os-7" do
  version "2026.05.25"
  sha256 "bfa967354c13418d679793818076a0e9c64640801ebbc62c2a92c8fe450a8a7e"

  # Version at end of the url works around Homebrew's
  # insistence on skipping checksums on unversioned URLs.
  url "https://mendelson.org/System761.zip##{version}"
  name "mac-os-7"
  desc "Classic Macintosh emulator via BasiliskII"
  homepage "https://mendelson.org/macos9osx.html"

  livecheck do
    url :url
    strategy :extract_plist do |items|
      items["org.wpdos.system761"].short_version
    end
  end

  depends_on :macos

  app "System761.app", target: "Mac OS 7.app"
end
