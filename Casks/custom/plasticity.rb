cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.1.8"
  sha256 arm:   "e251af4ac92f9d2efe22b9224a15df2c315ea18496fc9f3124c62c61a57238ee",
         intel: "0e6c8e6bca06dbdefb3973d1bb8bfd522120693a329bcada58b70bcf43498b15"

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
