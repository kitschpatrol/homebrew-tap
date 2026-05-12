cask "max-messages" do
  version "1.1.2"
  sha256 "1d2f9b35e0b01e9db7fa7cd67ed324ff143ea43464eca3a8821c5b4577e61485"

  url "https://mailarchiver.b-cdn.net/MAXMessages#{version}.dmg",
      verified: "mailarchiver.b-cdn.net/"
  name "MAX Messages"
  desc "Archive your messages"
  homepage "https://www.mothsoftware.com/content/content/maxmessages.php"

  livecheck do
    url "https://www.mothsoftware.com/content/downloadsuccess/success_maxmessages.php"
    regex(/MAXMessages(\d+(?:\.\d+)+)\.dmg/i)
  end

  depends_on :macos

  installer manual: "MAX Messages Installer.app"

  uninstall delete: "/Applications/MAX Messages"
end
