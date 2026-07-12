cask "oak-viewer" do
  arch arm: "arm_64", intel: "x86_64"

  version "3.2.1"
  sha256 arm:   "301987609411c8adb9b7b718c42ddcfde558b419ed754eda403427c6e365fd27",
         intel: "5756b0221ae9cac9edabbb2156be13486f2a5cda8c47bef31d47a33b0ab8eb50"

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
