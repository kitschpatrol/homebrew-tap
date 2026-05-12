cask "cadova-viewer" do
  version "0.2.1"
  sha256 "a809219a0924949e45757b91fe67755fc415b61c76b34825dcc128cfc016eb54"

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
