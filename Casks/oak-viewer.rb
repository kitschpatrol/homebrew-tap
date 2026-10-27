cask "oak-viewer" do
  arch arm: "arm_64", intel: "x86_64"

  version "4.1.6"
  sha256 arm:   "56a54a7d0e2dd4e98d568146cd7acaf3111ece6860f64adbeb1b2dcf0bfea220",
         intel: "833627d95e2dae2e1a3fb898f772500d733eb99baf97d041dc5aedfa4ca5dc9c"

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
