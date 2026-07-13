cask "deskmat" do
  version "1.3.1"
  sha256 "0e296c1ae32091f456b424d9e1170d6434da83eab3a71dbf9e9593cb4b3b6303"

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
