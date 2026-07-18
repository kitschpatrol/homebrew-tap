cask "cadova-viewer" do
  version "1.1.1"
  sha256 "97a9d0d36673cab39c043aab9aa06a0966223fb096b1fd01d1193f57d5fbcedc"

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
