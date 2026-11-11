cask "cadova-viewer" do
  version "1.3.3"
  sha256 "f3e563d383700438178f4f0f0cd9d9fcbf6332a3f9d9e2b1b09af69abb80ebce"

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
