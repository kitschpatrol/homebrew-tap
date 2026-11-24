cask "oak-viewer" do
  arch arm: "arm_64", intel: "x86_64"

  version "4.5.1"
  sha256 arm:   "c905d595d55c46323ee53128b6ec8615d52cd137e2632b63b23ef120bb3378fa",
         intel: "f5c5822717b2e7e66f6acab764ec45418c63ae92b1c77788bc1bac2879a9f706"

  url "https://oak-viewer-releases.luxonis.com/data/#{version}/macos_#{arch}/Viewer.dmg"
  name "OAK Viewer"
  desc "Visualize output from Luxonis OAK cameras"
  homepage "https://docs.luxonis.com/software-v3/depthai/tools/oak-viewer/"

  livecheck do
    url "https://docs.luxonis.com/software-v3/depthai/tools/oak-viewer.md"
    regex(%r{/data/v?(\d+(?:\.\d+)+)/macos_arm_64/Viewer\.dmg}i)
  end

  depends_on macos: :monterey

  app "OAK Viewer.app"

  zap trash: [
    "~/Library/Application Support/OAK Viewer",
    "~/Library/Preferences/com.electron.oak-viewer.plist",
    "~/Library/Saved Application State/com.electron.oak-viewer.savedState",
  ]
end
