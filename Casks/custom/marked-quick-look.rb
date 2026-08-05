cask "marked-quick-look" do
  version "1.0.12,30"
  sha256 "67333542192c27bd854269ecd559753377eca4705b2092fef909460385c396dd"

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
