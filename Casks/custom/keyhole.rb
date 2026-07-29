cask "keyhole" do
  version "1.2.1"
  sha256 "914b4788f25b0705acee13519292ea8717b7d3d914188f6b270b11ec32bb5f7a"

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
