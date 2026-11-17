cask "nurb" do
  arch intel: "-intel"

  version "1.9.0"
  sha256 arm:   "c59a6397f8c7f196fe946ad70c6abbd041415215211226a52688bad1b8d87fb5",
         intel: "16e2529bd8c7f0155310e448bc608fd6c280dd0a31b498a5781b3e751623804a"

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
