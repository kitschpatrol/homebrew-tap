cask "oak-viewer" do
  arch arm: "arm_64", intel: "x86_64"

  version "4.2.8"
  sha256 arm:   "148d4e7894117c900045aad5cbae5f94e28b78ad46c215dd14f819301cc03ca0",
         intel: "cd8604e66012c7c2855ac16faca806e2adb161b5fdb5902e1d817522235bce26"

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
