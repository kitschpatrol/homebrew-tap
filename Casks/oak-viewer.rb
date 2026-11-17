cask "oak-viewer" do
  arch arm: "arm_64", intel: "x86_64"

  version "4.4.1"
  sha256 arm:   "4e7f22fb26d1c181097af58df7e7e1ad2d946234e438968e8895f31a2a9d520a",
         intel: "ef7c544e0c18ae85a1638afc51f741eee53c2c181759b2b70d8b6125cf0fccb5"

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
