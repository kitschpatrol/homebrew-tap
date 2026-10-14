class Yanki < Formula
  desc "Turn Markdown into Anki flashcards"
  homepage "https://github.com/kitschpatrol/yanki"
  url "https://registry.npmjs.org/yanki/-/yanki-3.2.0.tgz"
  sha256 "f404164a6ba62a0aafa7a68f09fa2ed63b4a73c4ba0f314b78b58c129d701380"
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
