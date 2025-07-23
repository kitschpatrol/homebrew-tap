cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.2.2"
  sha256 arm:   "2adfe62ac2fa2867d1852c35349a20d1253cb6ee2289f014a134490511b0f90d",
         intel: "901d32b2aa66dd16a625c7d3b3091a93904ea4ff0d8d76356e8915875ec717f2"

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
