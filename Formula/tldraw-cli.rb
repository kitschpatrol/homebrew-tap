class TldrawCli < Formula
  desc "Exporting tldraw sketches to PNG or SVG images"
  homepage "https://github.com/kitschpatrol/tldraw-cli"
  url "https://registry.npmjs.org/@kitschpatrol/tldraw-cli/-/tldraw-cli-6.0.4.tgz"
  sha256 "ce70dc59a8049e49a684669e12137fea6ce167581502274559ab67564fd30741"
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
