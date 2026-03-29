cask "max-messages" do
  version "1.0.1"
  sha256 "eafbb8bb0797e10459398872970b468eeeb16298d4b5cb0bbf3c3e1b1bc8d46e"

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
