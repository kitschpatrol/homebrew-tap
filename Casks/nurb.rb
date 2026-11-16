cask "nurb" do
  arch intel: "-intel"

  version "1.7.1"
  sha256 arm:   "11fb4af111007123a500533f4e8b53b368621ec4598ee1080da11fa436e99d23",
         intel: "774e0511467d0cbc76326bfaffe2978cd2098576fe2452bd5e61b7df9da805e7"

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
