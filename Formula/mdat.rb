class Mdat < Formula
  desc "Turn comments into content in Markdown files"
  homepage "https://github.com/kitschpatrol/mdat"
  url "https://registry.npmjs.org/mdat/-/mdat-3.6.3.tgz"
  sha256 "4059ee69e886ef436ab8a4e9eb4666ea9e284c3e479ee99c2ea087aa8f809a06"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mdat --version")
  end
end
