cask "nurb" do
  arch intel: "-intel"

  version "1.14.1"
  sha256 arm:   "629d09237d5e85819d9e2cdaed0f00261314ee95107aabfd03580a47ccac562d",
         intel: "6e5249cefa9cc46bccd649bad9a2c7b7cc3aaa5f76bc91c4577658b27d10a11a"

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
