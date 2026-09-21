cask "oak-viewer" do
  arch arm: "arm_64", intel: "x86_64"

  version "3.9.8"
  sha256 arm:   "cdd3fe1bfa6eb354de3d69573c813e482b340c005ccd1f01deb43f9523ae2cdb",
         intel: "708f9a92ba8b5fcdd60a87a3d7e2c13fe3c293f693eb406a46ce2d22eccdb092"

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
