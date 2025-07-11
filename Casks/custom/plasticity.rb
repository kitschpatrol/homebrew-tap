cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.2.0"
  sha256 arm:   "fb2bd8fa3af23adeaa7c37e70969a723203f93f2eb715e9251818e92721717a0",
         intel: "b62727666141e583d17ca43e9ec9726a21d7bbd9925c2bd2aefbf7847a7d3b9e"

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
