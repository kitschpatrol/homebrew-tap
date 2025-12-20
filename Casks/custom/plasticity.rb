cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.3.3"
  sha256 arm:   "6566449379773efcf7d51fcc223f5d28e3c5b30841e8ded32fdfbd3bb4dc4d2f",
         intel: "e088f0a091f52e569b13e401e8205b763535148548226863a878a73ad3d66ca4"

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
