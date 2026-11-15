class Yanki < Formula
  desc "Turn Markdown into Anki flashcards"
  homepage "https://github.com/kitschpatrol/yanki"
  url "https://registry.npmjs.org/yanki/-/yanki-3.2.3.tgz"
  sha256 "f10bcedb7d33325c86667a2e44258c4a70505e5521c974e47e79aff0d785d866"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yanki --version")
  end
end
