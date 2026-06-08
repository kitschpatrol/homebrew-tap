cask "keyhole" do
  version "1.2"
  sha256 "3396caeaf794f547ac4301236e5e956100f9992dd9d196db00ab284f30303744"

  url "https://github.com/iKenndac/Keyhole/releases/download/#{version}/Keyhole.zip",
      verified: "github.com/iKenndac/Keyhole/"
  name "Keyhole"
  desc "Choose which app responds to your media keys"
  homepage "https://ikennd.ac/keyhole/"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)+)$/)
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Keyhole.app"
end
