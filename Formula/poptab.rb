class Poptab < Formula
  desc "Clean up specific browser tabs"
  homepage "https://github.com/kitschpatrol/poptab"
  url "https://registry.npmjs.org/poptab/-/poptab-1.2.2.tgz"
  sha256 "0a8625017a9a5cc156cfee1770fc7491822f2142c72bad85721bf655c0803fa6"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/poptab --version")
  end
end
