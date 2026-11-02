class Snip < Formula
  desc "Snippet management"
  homepage "https://github.com/kitschpatrol/snip"
  url "https://registry.npmjs.org/@kitschpatrol/snip/-/snip-0.0.17.tgz"
  sha256 "c69a6ba935f90cd6cc13c0687c33be4ba7bf44a630aeae17906a8ebfb0353208"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/snip --version")
  end
end
