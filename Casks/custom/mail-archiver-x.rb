cask "mail-archiver-x" do
  version "8.2.2"
  sha256 "2b0d54fccba08b94af9438c3b33a7728d5465c0982791ae5e36b1fa462c3e81a"

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
