class Yanki < Formula
  desc "Turn Markdown into Anki flashcards"
  homepage "https://github.com/kitschpatrol/yanki"
  url "https://registry.npmjs.org/yanki/-/yanki-3.0.0.tgz"
  sha256 "5c0f6d7b667703725b9fd14648437b1e74a1f0e64fe2b2dbc97e8db34e72c5fb"
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
