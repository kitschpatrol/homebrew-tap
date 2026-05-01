cask "max-messages" do
  version "1.1.1"
  sha256 "4b70de0332df3b1406afdea959b4bc984e7676f98bf581702d6f86ce3f8a0304"

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
