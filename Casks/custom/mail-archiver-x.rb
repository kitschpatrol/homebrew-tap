cask "mail-archiver-x" do
  version "8.2.1"
  sha256 "9331331feea4f73d57292ebd16be8de41d2714d8268ed1bc22c624cc31698eeb"

  url "https://mailarchiver.b-cdn.net/MailArchiverX#{version}.dmg",
      verified: "mailarchiver.b-cdn.net/"
  name "Mail Archiver X"
  desc "Archive your email"
  homepage "https://www.mothsoftware.com/content/content/mailarchiverx.php"

  livecheck do
    url "https://www.mothsoftware.com/content/downloadsuccess/success.php"
    regex(/MailArchiverX(\d+(?:\.\d+)+)\.dmg/i)
  end

  depends_on :macos

  installer manual: "Mail Archiver X Installer.app"

  # Should run "Mail Archiver X Uninstaller.app" instead?
  uninstall delete: "/Applications/Mail Archiver X"
end
