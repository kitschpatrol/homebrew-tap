cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.2.4"
  sha256 arm:   "3c15189e100ef2ec3b94bd25b040ef12810488c7097049b7d526242dd1c0600d",
         intel: "6a0dd71c4cc149b21847bb3200f5c6e973f2a21043ddb1ca4df9f873008dc46a"

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
