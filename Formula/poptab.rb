class Poptab < Formula
  desc "Clean up specific browser tabs"
  homepage "https://github.com/kitschpatrol/poptab"
  url "https://registry.npmjs.org/poptab/-/poptab-1.2.3.tgz"
  sha256 "1aa37122a0af0fc5d826c162649fa5f1d29a1f6b042426663cd530c00bae4dd7"
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
