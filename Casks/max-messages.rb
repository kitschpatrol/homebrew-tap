cask "max-messages" do
  version "1.2.1"
  sha256 "9b7460da2fcaeb023a2369901b9f059806ab2aabbe12c4850012d2be21a1870a"

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
