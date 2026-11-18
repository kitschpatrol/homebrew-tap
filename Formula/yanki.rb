class Yanki < Formula
  desc "Turn Markdown into Anki flashcards"
  homepage "https://github.com/kitschpatrol/yanki"
  url "https://registry.npmjs.org/yanki/-/yanki-3.3.0.tgz"
  sha256 "e4e04b14e534d978c6215481490798e05a90f0bd0aec821c0e7736b38f3ba8d7"
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
