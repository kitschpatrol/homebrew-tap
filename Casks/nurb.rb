cask "nurb" do
  arch intel: "-intel"

  version "1.6.0"
  sha256 arm:   "86fd0fc324a8a462effcbdb1adcbcb145dc368176832812e8350d6da6b74e12d",
         intel: "35997d5f505cd3a31cfdcf2192b5b0ed4153e8882986245b4db3e636ac0c989d"

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
