class Renami < Formula
  desc "Config-driven and content-aware automatic filename management"
  homepage "https://github.com/kitschpatrol/renami"
  url "https://registry.npmjs.org/@kitschpatrol/renami/-/renami-0.3.2.tgz"
  sha256 "714ac809c095dc4a5206db6d4e27ffcbdffb88f681dc41607c266a228c603c2b"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/renami --version")
  end
end
