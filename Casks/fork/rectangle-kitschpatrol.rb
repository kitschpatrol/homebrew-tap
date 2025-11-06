cask "rectangle-kitschpatrol" do
  version "0.43.2"
  sha256 "1bfbef2243dcea9b3bb41fef887e4727bc69683e3356703265a9ccc519724ad2"

  url "https://github.com/kitschpatrol/Rectangle/releases/download/v#{version}/Rectangle.zip",
      verified: "github.com/kitschpatrol/Rectangle/"
  name "Rectangle"
  desc "Move and resize windows using keyboard shortcuts or snap areas"
  homepage "https://rectangleapp.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Rectangle.app"

  uninstall quit: "com.ericmika.Rectangle"

  zap trash: [
    "~/Library/Application Scripts/com.ericmika.RectangleLauncher",
    "~/Library/Application Support/Rectangle",
    "~/Library/Caches/com.ericmika.Rectangle",
    "~/Library/Containers/com.ericmika.RectangleLauncher",
    "~/Library/HTTPStorages/com.ericmika.Rectangle",
    # Preserve preferences...
    # "~/Library/Preferences/com.ericmika.Rectangle.plist",
  ]
end
