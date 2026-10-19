class Mdat < Formula
  desc "Turn comments into content in Markdown files"
  homepage "https://github.com/kitschpatrol/mdat"
  url "https://registry.npmjs.org/mdat/-/mdat-3.6.5.tgz"
  sha256 "356925701093e01db600f28bd049bddb9650dc94645f1a2a030b934c1ecceb43"
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
