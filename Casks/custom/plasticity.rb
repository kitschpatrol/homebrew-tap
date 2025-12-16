cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.3.0"
  sha256 arm:   "05322220b2ec84400ea017d6f6c60f327cb49b60cc92ce7e232cea9e29493ce7",
         intel: "a0e7edaba8c4ec92ead25fdde4f5513f7a5e8c72c1bac7f4fdd89b072715c0f8"

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
