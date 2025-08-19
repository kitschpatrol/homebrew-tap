cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.2.5"
  sha256 arm:   "03380dcbb3a6a4f16b9698ded28a846c1bcb48652d4748f699262486bfc14331",
         intel: "3404c1a285a6f8ac95ed16b9f3d83f3fe7bc0a2d892d40f129ea1b2d510c05b4"

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
