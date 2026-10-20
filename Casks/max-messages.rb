cask "max-messages" do
  version "1.2.0"
  sha256 "bb0b68892e0eb5bd18e3cdf8b67a020a8ac831bacfd45aab6417bf8e6e0ff904"

  url "https://mailarchiver.b-cdn.net/MAXMessages#{version}.dmg"
  name "MAX Messages"
  desc "Archive your messages"
  homepage "https://www.mothsoftware.com/content/content/maxmessages.php"

  livecheck do
    url "https://www.mothsoftware.com/content/downloadsuccess/success_maxmessages.php"
    regex(/MAXMessages(\d+(?:\.\d+)+)\.dmg/i)
  end

  depends_on :macos

  suite "MAX Messages Installer.app/Contents/Helpers", target: "MAX Messages"

  uninstall quit: "com.mothsoftware.messages"

  zap trash: [
    "~/Library/Application Support/MAX Messages",
    "~/Library/Preferences/com.mothsoftware.messages.plist",
  ]
end
