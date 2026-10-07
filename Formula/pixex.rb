class Pixex < Formula
  desc "Pixelmator Export"
  homepage "https://github.com/kitschpatrol/pixex"
  url "https://registry.npmjs.org/pixex/-/pixex-0.2.1.tgz"
  sha256 "780acd2327003ba7f1507ba6c381f695b684fce6a6e6eac0d0caa1139d29c36e"
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
