cask "sensiblesidebuttons-desousak" do
  version "1.08.2"
  sha256 "452da70fc5c6cebcaf08c105fa1d36fc28507023747da12a2d9619373c9b2d35"

  url "https://github.com/Desousak/sensible-side-buttons/releases/download/#{version}/SensibleSideButtons.app.zip",
      verified: "github.com/Desousak/sensible-side-buttons/"
  name "Sensible Side Buttons"
  desc "Turns mouse side navigation buttons into swipe gestures on a per-app basis"
  homepage "https://sensible-side-buttons.archagon.net/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "SensibleSideButtons.app"

  zap trash: "~/Library/Preferences/net.archagon.sensible-side-buttons.plist"
end
