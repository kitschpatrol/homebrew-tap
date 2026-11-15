cask "nurb" do
  arch intel: "-intel"

  version "1.5.0"
  sha256 arm:   "96a62ca40531471b74300a8dc56c0225d314331d97340a7ed3fc01b6c8912702",
         intel: "eb60ec93bc35c71e48ae80ad413d565113860e7761d4e5dc252b858b5521f372"

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
