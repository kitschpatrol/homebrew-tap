cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.2.6"
  sha256 arm:   "2d8547825234e6f4c99900c6190d778573c951fa1c27df7378da9bf0362f3343",
         intel: "f46fdcc9f0676e4fcaa81cc5c4585252d9f0290fa066cbcb4d480e9ecfd9604b"

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
