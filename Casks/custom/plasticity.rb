cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.2.11"
  sha256 arm:   "229b987acf70173e14f778259e50f8e629c172e98d3bba7cd699fae3388b345f",
         intel: "e3505458805efdc19507d07098fa24f1729d8c30233fac1109d2652819444745"

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
