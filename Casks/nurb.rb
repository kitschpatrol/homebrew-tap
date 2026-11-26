cask "nurb" do
  arch intel: "-intel"

  version "1.14.0"
  sha256 arm:   "afaa73c99e03b0090333197ed6c1931ca391490dbfe59670a6d67807df7cbe01",
         intel: "2698afdbda6d019aea37f76ca0e70dafba58c203551cafda5eddca45bca508f8"

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
