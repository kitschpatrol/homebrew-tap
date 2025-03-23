cask "mail-archiver-x" do
  version "7.3.5"
  sha256 "3e67a3948b5307db4ef24b7d17ee5344f242c41126c151be170a91b9cab4c07f"

  url "https://mailarchiver.b-cdn.net/MailArchiverX#{version}.dmg",
      verified: "mailarchiver.b-cdn.net/"
  name "Mail Archiver X"
  desc "Archive your email"
  homepage "https://www.mothsoftware.com/"

  livecheck do
    url "https://www.mothsoftware.com/content/download/download.php"
    regex(%r{<p>(\d+(?:\.\d+)+)</p>}i)
  end

  installer manual: "Mail Archiver X Installer.app"

  # Should run "Mail Archiver X Uninstaller.app" instead?
  uninstall delete: "/Applications/Mail Archiver X"
end
