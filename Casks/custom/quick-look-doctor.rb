cask "quick-look-doctor" do
  version "1.0,3"
  sha256 "458c7841cdcd762387243e9a972eb056e3b78c4a53a9f96687cfca7f47f223e8"

  url "https://updates.markedapp.com/updates/QuickLookDr%20#{version.csv.first}-#{version.csv.second}.zip"
  name "Quick Look Doctor"
  desc "Diagnose and resolve Quick Look preview handler conflicts"
  homepage "https://markedapp.com/ql/doctor/"

  livecheck do
    url "https://updates.markedapp.com/updates/quicklookdr.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :ventura

  app "QuickLookDoctor.app"

  zap trash: [
    "~/Library/Caches/com.brettterpstra.QuickLookDoctor",
    "~/Library/HTTPStorages/com.brettterpstra.QuickLookDoctor",
    "~/Library/Preferences/com.brettterpstra.QuickLookDoctor.plist",
    "~/Library/Saved Application State/com.brettterpstra.QuickLookDoctor.savedState",
  ]
end
