cask "all-work" do
  version "1.0.0"
  sha256 "e6c82ad8836115aa515cd461b9e699e6783ea0c25e689d0cdccfbeb19bac16ad"

  url "https://github.com/kitschpatrol/all-work/releases/download/v#{version}/all-work_#{version}-mac-arm64.zip"
  name "All Work"
  desc "Parallel command runner and data table to tame and tend your local Git projects"
  homepage "https://github.com/kitschpatrol/all-work"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "All Work.app"

  zap trash: [
    "~/Library/Application Support/All Work",
    "~/Library/Caches/All Work",
    "~/Library/Caches/all-work-updater",
    "~/Library/Caches/com.ericmika.all-work.ShipIt",
    "~/Library/Logs/All Work",
    "~/Library/Preferences/com.ericmika.all-work.plist",
  ]
end
