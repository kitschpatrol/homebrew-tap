class Mdat < Formula
  desc "Turn comments into content in Markdown files"
  homepage "https://github.com/kitschpatrol/mdat"
  url "https://registry.npmjs.org/mdat/-/mdat-3.6.6.tgz"
  sha256 "d8b50130d9de60814f9fc099585274588e717a674087d43d49ecabe8602d847a"
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
