cask "nurb" do
  arch intel: "-intel"

  version "0.26.0"
  sha256 arm:   "a8fecccf0aadae42a792866bedcdefc426a34dfd63334c8795c781d7539985c3",
         intel: "a6d892efa06b0f8a1cabe805f1a8744660c999fec9e85e98d3d98e43eaaac4ed"

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
