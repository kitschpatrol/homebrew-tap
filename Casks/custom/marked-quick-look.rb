cask "marked-quick-look" do
  version "1.0.18,36"
  sha256 "c01fa87c9c2673db9c9b84e75b2816cb6c73a2a13495cfbc3a629df4babcc336"

  url "https://updates.markedapp.com/updates/MarkedQuickLook%20#{version.csv.first}-#{version.csv.second}.zip"
  name "Marked Quick Look"
  desc "Quick Look previews for Markdown files with Marked-style rendering"
  homepage "https://markedapp.com/ql/"

  livecheck do
    url "https://updates.markedapp.com/updates/markedquicklook.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :ventura

  app "Marked Quick Look.app"

  zap trash: [
    "~/Library/Caches/com.brettterpstra.MarkedQuickLook-direct",
    "~/Library/HTTPStorages/com.brettterpstra.MarkedQuickLook-direct",
    "~/Library/Preferences/com.brettterpstra.MarkedQuickLook-direct.plist",
    "~/Library/Saved Application State/com.brettterpstra.MarkedQuickLook-direct.savedState",
  ]
end
