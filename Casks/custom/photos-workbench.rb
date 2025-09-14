cask "photos-workbench" do
  version "1.5"
  sha256 "799831d30ff212ec8e97ff0c6452fb493f0c5971eae202b97ab3f1d0b32f47dc"

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
