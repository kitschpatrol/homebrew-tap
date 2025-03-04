cask "plasticity" do
  arch arm: "arm64", intel: "x64"

  version "25.1.3"
  sha256 arm:   "a9ee0de915f268160b106d393fa251e6cc26b15e53b3489cb7ffb20a6e873b21",
         intel: "ed6c4a15f518afb53702d673cf7c9e8f3055852966d7c857747b076884859303"

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
