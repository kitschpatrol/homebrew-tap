class TldrawCli < Formula
  desc "Exporting tldraw sketches to PNG or SVG images"
  homepage "https://github.com/kitschpatrol/tldraw-cli"
  url "https://registry.npmjs.org/@kitschpatrol/tldraw-cli/-/tldraw-cli-6.1.1.tgz"
  sha256 "73ddf1322be59ea1fa38df3a23818b86b4dbb08fb12a663dddafc91dc57f48cd"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/tldraw-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tldraw-cli --version")
  end
end
