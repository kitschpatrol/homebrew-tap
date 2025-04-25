cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.1.9"
  sha256 arm:   "57bf2128b74d00a14eb4b2217ee73be876cec8e708a4d37ecbed7876fa9c4161",
         intel: "6ec50f809d378507a5465ba225ff225b64038a488228b7c859bbe596a50c2991"

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
