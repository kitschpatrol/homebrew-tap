cask "deskmat" do
  version "1.3.5"
  sha256 "da3a388b72b6680091fafe30dadc97dfd217bd8bd359ba833dd8058956252fe3"

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
