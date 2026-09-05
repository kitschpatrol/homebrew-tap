cask "mail-archiver-x" do
  version "8.2.2"
  sha256 "2b0d54fccba08b94af9438c3b33a7728d5465c0982791ae5e36b1fa462c3e81a"

  url "https://mailarchiver.b-cdn.net/MailArchiverX#{version}.dmg"
  name "Mail Archiver X"
  desc "Archive your email"
  homepage "https://www.mothsoftware.com/content/content/mailarchiverx.php"

  livecheck do
    url "https://www.mothsoftware.com/content/downloadsuccess/success.php"
    regex(/MailArchiverX(\d+(?:\.\d+)+)\.dmg/i)
  end

  depends_on :macos

  suite "Mail Archiver X Installer.app/Contents/Helpers", target: "Mail Archiver X"

  postflight_steps do
    unless_path_exists "~/Documents/Mail Archiver X/Standard Template.html" do
      mkdir_p "~/Documents/Mail Archiver X"
      copy "Mail Archiver X Installer.app/Contents/Resources/Standard Template.html",
           "~/Documents/Mail Archiver X/Standard Template.html"
    end
  end

  uninstall launchctl: "com.mothsoftware.mailarchiverx-helper.launchd",
            quit:      [
              "com.mothsoftware.mailarchiverx",
              "com.mothsoftware.mailarchiverx-helper",
            ]

  zap trash: [
    "~/Library/Application Support/.MailArchiverX5",
    "~/Library/Application Support/Mail Archiver X",
    "~/Library/Preferences/com.mothsoftware.mailarchiverx.plist",
  ]
end
