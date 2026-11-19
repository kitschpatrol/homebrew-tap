cask "nurb" do
  arch intel: "-intel"

  version "1.12.0"
  sha256 arm:   "b606495d4e829e3a3f598eef03c74633b8fb7c49331d1399b398683f853f63b6",
         intel: "e8d4213074024b9926440f92b444c32dfc5e5c9b77712f5f8116534ee83f01a8"

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
