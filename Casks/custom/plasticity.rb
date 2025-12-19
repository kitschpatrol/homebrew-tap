cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.3.2"
  sha256 arm:   "ac14a1a6659e91853747e94b59ed2d55ee9b768d3630f7e0a75b0b6cb554b0e4",
         intel: "4b30a9b1ec1d83f568661cbebc84110867949213ebf37434c15d2736ef90aafd"

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
