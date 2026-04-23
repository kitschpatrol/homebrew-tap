cask "max-messages" do
  version "1.1.0"
  sha256 "e836cf9a398b7686c2e9be6ef27e211aae15add6a4a8d2937b50d3eef740ab32"

  url "https://mailarchiver.b-cdn.net/MAXMessages#{version}.dmg",
      verified: "mailarchiver.b-cdn.net/"
  name "MAX Messages"
  desc "Archive your messages"
  homepage "https://www.mothsoftware.com/content/content/maxmessages.php"

  livecheck do
    url "https://www.mothsoftware.com/content/downloadsuccess/success_maxmessages.php"
    regex(/MAXMessages(\d+(?:\.\d+)+)\.dmg/i)
  end

  installer manual: "MAX Messages Installer.app"

  uninstall delete: "/Applications/MAX Messages"
end
