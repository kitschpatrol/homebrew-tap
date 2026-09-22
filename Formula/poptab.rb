class Poptab < Formula
  desc "Clean up specific browser tabs"
  homepage "https://github.com/kitschpatrol/poptab"
  url "https://registry.npmjs.org/poptab/-/poptab-1.2.1.tgz"
  sha256 "e5c0cff7caee575973e8c4c8eb283a39b5bdae9526af157ca587cbf2d31e61ae"
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
