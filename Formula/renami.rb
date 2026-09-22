class Renami < Formula
  desc "Config-driven and content-aware automatic filename management"
  homepage "https://github.com/kitschpatrol/renami"
  url "https://registry.npmjs.org/@kitschpatrol/renami/-/renami-0.3.1.tgz"
  sha256 "59beae7092c4e8ac003fb8b7e3f15f9e40a4ba12a89f3149fd2e5d02cc05d06f"
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
