cask "cadova-viewer" do
  version "1.2.0"
  sha256 "9869f9cb3ad8aef4e33f76f0b52a46dfa65e7745bab40177ac31714f2406de7d"

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
