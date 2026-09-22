class Pixex < Formula
  desc "Pixelmator Export"
  homepage "https://github.com/kitschpatrol/pixex"
  url "https://registry.npmjs.org/pixex/-/pixex-0.1.1.tgz"
  sha256 "697939dc9e36181f00df5bb43a20bbd249c0eac4dc48d79e4ebb8e596d842b08"
  license "MIT"

  depends_on :macos
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pixex --version")
  end
end
