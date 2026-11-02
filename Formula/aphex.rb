class Aphex < Formula
  desc "Apple Photos Export"
  homepage "https://github.com/kitschpatrol/aphex"
  url "https://registry.npmjs.org/@kitschpatrol/aphex/-/aphex-0.1.6.tgz"
  sha256 "7ec45718ee3da4a0eba1492453a37e5f74b054ea0d2ea8e74140e8ffce2990fd"
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
