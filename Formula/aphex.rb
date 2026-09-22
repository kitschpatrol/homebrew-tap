class Aphex < Formula
  desc "Apple Photos Export"
  homepage "https://github.com/kitschpatrol/aphex"
  url "https://registry.npmjs.org/@kitschpatrol/aphex/-/aphex-0.1.4.tgz"
  sha256 "e8ec15d015a8fd2493006101b3be16ce335ed65f8bfee1c9daaf81780b164dad"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aphex --version")
  end
end
