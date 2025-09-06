cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.2.8"
  sha256 arm:   "0a3aceb2671f6f21207aef6e61eff39038f080ce7f034695d8b4e2a0a33fdb26",
         intel: "d899201e9c0aa6a8de2aba8ff8f3ceefbda9a3795486cbcb8fc4780bef5dbce3"

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
