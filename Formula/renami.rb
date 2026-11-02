class Renami < Formula
  desc "Config-driven and content-aware automatic filename management"
  homepage "https://github.com/kitschpatrol/renami"
  url "https://registry.npmjs.org/@kitschpatrol/renami/-/renami-0.3.4.tgz"
  sha256 "39d1e663f8d379b58cf5d72b24b861e8f713cdd414f7105a81c1462afde8732b"
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
