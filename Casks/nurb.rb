cask "nurb" do
  arch intel: "-intel"

  version "1.3.0"
  sha256 arm:   "2dda4f1ff432c5cacc0f09411d21c5aacc676d57ba75677f36ee6d438a338974",
         intel: "6aa3c9bdcd831eb2cc3318f3a23ec815ca8a8b5b61259655e2888b6281bd0f67"

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
