cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.3.7"
  sha256 arm:   "935f88bb12e2243ed8486dec7e63d12ec33ed735aabc4c402e9a21094afafd05",
         intel: "ca283309d149204adbe8761ddfb8ed1db5a24c01ddd7614336bd5117b7b91185"

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
