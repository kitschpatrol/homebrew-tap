cask "mail-archiver-x" do
  version "8.1.1"
  sha256 "95d09c81622cf6f1e8e4a874dff6c14e86452383a9b1c984d53fc1af7461ceb7"

  url "https://mailarchiver.b-cdn.net/MailArchiverX#{version}.dmg",
      verified: "mailarchiver.b-cdn.net/"
  name "Mail Archiver X"
  desc "Archive your email"
  homepage "https://www.mothsoftware.com/content/content/mailarchiverx.php"

  livecheck do
    url "https://www.mothsoftware.com/content/downloadsuccess/success.php"
    regex(/MailArchiverX(\d+(?:\.\d+)+)\.dmg/i)
  end

  installer manual: "Mail Archiver X Installer.app"

  # Should run "Mail Archiver X Uninstaller.app" instead?
  uninstall delete: "/Applications/Mail Archiver X"
end
