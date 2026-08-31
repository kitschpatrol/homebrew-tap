cask "nurb" do
  arch intel: "-intel"

  version "0.24.0"
  sha256 arm:   "13dd2d89f118decf418c111b83f8e8196763bcb54aea4bf89770d865ae55d49e",
         intel: "922b67c853e9a388c0338f35632a50dfe1cdd0bb48874b293679d9a4b586eba5"

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
