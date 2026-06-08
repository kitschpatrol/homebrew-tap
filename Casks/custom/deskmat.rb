cask "deskmat" do
  version "1.3"
  sha256 "3ae7be1c455d90b36b29b1d6cac5d30d92cade861883cb5fbb22a1483ab5f905"

  # Version at end of the url works around Homebrew's
  # insistence on skipping checksums on unversioned URLs.
  url "https://downloads.eternalstorms.at/DeskMat.zip##{version}"
  name "DeskMat"
  desc "Hide files and folders on your Desktop"
  homepage "https://eternalstorms.at/DeskMat/"

  livecheck do
    url "https://updates.eternalstorms.at/notes/DMMC/?f=plain"
    regex(/DeskMat\s+v?(\d+(?:\.\d+)+)/i)
  end

  auto_updates true
  depends_on macos: :ventura

  app "DeskMat.app"
end
