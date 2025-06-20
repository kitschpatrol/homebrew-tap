cask "photos-workbench" do
  version "1.4"
  sha256 "f9f2de26085b788d7fd1d2b79226fa17992471202dadef364f1c734fc42dd57e"

  url "https://www.houdah.com/photosWorkbench/download_assets/PhotosWorkbench#{version}.zip"
  name "Photos Workbench"
  desc "Organize, rate, and compare your photos"
  homepage "https://www.houdah.com/photosWorkbench/"

  livecheck do
    url "https://www.houdah.com/photosWorkbench/releaseNotes.html"
    regex(/Photos Workbench (\d+(?:\.\d+)+)/i)
  end

  app "Photos Workbench.app"
end
