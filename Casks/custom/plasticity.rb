cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.3.4"
  sha256 arm:   "a7328357fbc378b0d2ad08359e1bf3a3423f6718d1ed5bc37d2d8fe81eec8377",
         intel: "4ffd340aee17398050bf4b7c93130cd5b016970591df177c695d57c54cc27c3e"

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
