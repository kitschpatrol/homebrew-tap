cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.2.1"
  sha256 arm:   "472d8608a44b91c7253b3db6c877e0c1398449fe9894316a8254c54d8175ebe1",
         intel: "fec2db83bad2d93ca0ed216dfaf5973639c292e2e8f65367e0f8eb890a7c2541"

  url "https://github.com/nkallen/plasticity/releases/download/v#{version}/Plasticity-darwin-#{arch}-#{version}.zip",
      verified: "github.com/nkallen/plasticity/"
  name "Plasticity"
  desc "3D solid and surface modeling"
  homepage "https://www.plasticity.xyz/"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)+)$/)
  end

  depends_on macos: ">= :monterey"

  app "Plasticity.app"

  zap trash: [
    "~/Library/Application Support/Plasticity",
    "~/Library/Preferences/com.electron.plasticity.plist",
    "~/Library/Saved Application State/com.electron.plasticity.savedState",
  ]
end
