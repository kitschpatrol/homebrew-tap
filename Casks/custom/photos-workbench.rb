cask "photos-workbench" do
  version "1.6"
  sha256 "e9c9970bfe3d3dbf9cff3ec3ebb0a6a36ae03aecc49ee9710bdae3a1cf047eb0"

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
