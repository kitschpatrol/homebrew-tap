class Pixex < Formula
  desc "Pixelmator Export"
  homepage "https://github.com/kitschpatrol/pixex"
  url "https://registry.npmjs.org/pixex/-/pixex-0.2.2.tgz"
  sha256 "398f0bf174d456c0bb9c13ddca086a9494c1499ac54adeb32b245fcb976ba951"
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
