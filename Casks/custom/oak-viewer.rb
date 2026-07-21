cask "oak-viewer" do
  arch arm: "arm_64", intel: "x86_64"

  version "3.7.0"
  sha256 arm:   "4cb5501027f6ead9dcdcfa7ba6ded3ba51a4ba66ec26cc1580280ae71b2f876e",
         intel: "18f2492029469cdefe1e806c1b1cd08ef4e96c4240e04e7b99cf8320860f84cc"

  url "https://oak-viewer-releases.luxonis.com/data/#{version}/macos_#{arch}/Viewer.zip"
  name "OAK Viewer"
  desc "Visualize output from Luxonis OAK cameras"
  homepage "https://docs.luxonis.com/software-v3/depthai/tools/oak-viewer/"

  livecheck do
    url "https://docs.luxonis.com/software-v3/depthai/tools/oak-viewer.md"
    regex(%r{/data/v?(\d+(?:\.\d+)+)/macos_arm_64/Viewer\.zip}i)
  end

  depends_on macos: :monterey

  app "OAK Viewer.app"

  zap trash: [
    "~/Library/Application Support/OAK Viewer",
    "~/Library/Preferences/com.electron.oak-viewer.plist",
    "~/Library/Saved Application State/com.electron.oak-viewer.savedState",
  ]
end
