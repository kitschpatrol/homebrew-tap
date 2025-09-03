cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.2.7"
  sha256 arm:   "d25d694431131c587f071519565e4e3063e00a260e72b14f2e069c49bf804a14",
         intel: "59dfd386f65d9c607496f607322d3ef2fb5761b1c6792809768f7db35b442f88"

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
