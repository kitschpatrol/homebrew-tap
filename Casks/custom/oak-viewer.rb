cask "oak-viewer" do
  arch arm: "arm_64", intel: "x86_64"

  version "3.8.2"
  sha256 arm:   "669bab87cf1b1ffada2b5c0ccda165ac52736c8eddc14215448e3bf812055b81",
         intel: "b7aa7a0dc9f433bed0aec78cbd7870579bea77cac36640859babcd712cf6a94a"

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
