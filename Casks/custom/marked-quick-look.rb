cask "marked-quick-look" do
  version "1.0.20,39"
  sha256 "5c534d0aa1e46325eaa2f5670a834166e3cde7c521d5251b31e7e04e303d7285"

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
