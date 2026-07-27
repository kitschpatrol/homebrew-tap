cask "deskmat" do
  version "1.3.2"
  sha256 "cc694f276aa9585c1ee5dfd0aa174446d2338737d7386395acacc49d2c483fb6"

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
