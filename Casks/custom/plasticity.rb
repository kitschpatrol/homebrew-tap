cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.1.7"
  sha256 arm:   "861a2d0f0e3266728f4a7e9ef9bdbd69844e0f87dddde0a8a04530171dd38647",
         intel: "26e3c49878966bf5a1a18ca170964b3090a04fe8878d20f386abe421323360df"

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
