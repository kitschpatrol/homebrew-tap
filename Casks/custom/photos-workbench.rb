cask "photos-workbench" do
  version "1.3.4"
  sha256 "3acbfaa50bc83b68cfa71c51699e759d0cbb72df770782882d99e496de74710a"

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
