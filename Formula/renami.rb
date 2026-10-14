class Renami < Formula
  desc "Config-driven and content-aware automatic filename management"
  homepage "https://github.com/kitschpatrol/renami"
  url "https://registry.npmjs.org/@kitschpatrol/renami/-/renami-0.3.3.tgz"
  sha256 "b84e295413a0152008c871dda9093b443898e4fc24a26d50bbc107dfc8380949"
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
