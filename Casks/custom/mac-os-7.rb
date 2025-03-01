cask "mac-os-7" do
  version "2025.01.25"
  sha256 "f2ed8ce6da94d5e73b21cd04260593358c663a597907ba53557efe95723ccbe9"

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

  app "System761.app", target: "Mac OS 7.app"
end
