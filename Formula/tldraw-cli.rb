class TldrawCli < Formula
  desc "Exporting tldraw sketches to PNG or SVG images"
  homepage "https://github.com/kitschpatrol/tldraw-cli"
  url "https://registry.npmjs.org/@kitschpatrol/tldraw-cli/-/tldraw-cli-6.1.0.tgz"
  sha256 "c15989b96ccca6255d3cf3c25f4b7525aa2725f3a873a98d7ce7e7d84e5f10fd"
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
