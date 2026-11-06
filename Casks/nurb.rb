cask "nurb" do
  arch intel: "-intel"

  version "1.2.1"
  sha256 arm:   "c5d658033e4be2bf4ef954ee65af9197a74eb6a641ba7bf62fa0c11d574e8681",
         intel: "5760498f16598afdc0cd38671809fda8cc1f99bd959c04a1c13f9b276b538d1c"

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
