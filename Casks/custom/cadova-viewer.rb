cask "cadova-viewer" do
  version "1.0.0"
  sha256 "7ad7ba1eefd105d3d58d7e4c8e50a61d74c5cca999c4c52466c5f59411d1834e"

  url "https://github.com/tomasf/CadovaViewer/releases/download/#{version}/CadovaViewer#{version}.zip"
  name "Cadova Viewer"
  desc "Viewer for 3MF 3D model files"
  homepage "https://github.com/tomasf/CadovaViewer"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)+)$/)
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Cadova Viewer.app"
end
