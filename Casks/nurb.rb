cask "nurb" do
  arch intel: "-intel"

  version "1.1.0"
  sha256 arm:   "7996b72ebee6bcf4a3a4634a00d4cb9df8d8c354bb566fb8a6e6058378f0ed8a",
         intel: "b01207b43efa72c5286b54eb8071a82179c74c8ed3f6e59429747b9423792bd9"

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
