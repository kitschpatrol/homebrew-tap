cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.1.2"
  sha256 arm:   "ef4e4e9d09e3b24d4984d23385ed283f261699bd3b0037fcba5a472219939cc6",
         intel: "183c0d9f33334591d275dee64f8be58a194089ac5496bf53eef9987941531201"

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
