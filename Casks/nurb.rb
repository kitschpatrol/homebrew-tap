cask "nurb" do
  arch intel: "-intel"

  version "1.13.0"
  sha256 arm:   "f64c1aa80b23fd345aa0ab923261c0637c1ea20c593f4a9e6f04b58a6f95993e",
         intel: "d955c6db7347c8e87275f3bb0c86f8d9b586ddb04db3d7afe9cbe492a1c99b32"

  url "https://github.com/Shpigford/nurb/releases/download/v#{version}/nurb#{arch}.dmg"
  name "nurb"
  desc "Agentic CAD tool for 3D printing"
  homepage "https://github.com/Shpigford/nurb"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "nurb.app"

  zap trash: [
    "~/Library/Application Support/dev.nurb.desktop",
    "~/Library/Caches/dev.nurb.desktop",
    "~/Library/Preferences/dev.nurb.desktop.plist",
    "~/Library/Saved Application State/dev.nurb.desktop.savedState",
    "~/Library/WebKit/dev.nurb.desktop",
  ]
end
