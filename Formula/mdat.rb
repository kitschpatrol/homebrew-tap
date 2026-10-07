class Mdat < Formula
  desc "Turn comments into content in Markdown files"
  homepage "https://github.com/kitschpatrol/mdat"
  url "https://registry.npmjs.org/mdat/-/mdat-3.6.2.tgz"
  sha256 "e63afdba9ba7b15063fbcb15608ac817d14225451f04439cb4e71a7d31f084c6"
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
