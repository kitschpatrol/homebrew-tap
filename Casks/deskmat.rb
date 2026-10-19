cask "deskmat" do
  version "1.3.4"
  sha256 "a353f9ec15773cf2a007b131d7278acf7de93fe8836a5812a42e9d1e345bc6f1"

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
