cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.2.9"
  sha256 arm:   "dfe46977649373d07bb36ab9b13e4f878e651eca53a8509291f788d87c1ea2bd",
         intel: "f7c59dd7ac363d4eb97a39834f6ae97a36930bbe60c33635a7ccd22591cb570a"

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
