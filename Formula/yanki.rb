class Yanki < Formula
  desc "Turn Markdown into Anki flashcards"
  homepage "https://github.com/kitschpatrol/yanki"
  url "https://registry.npmjs.org/yanki/-/yanki-3.2.1.tgz"
  sha256 "17b3322cfa5c712f9920aa7875585855215c6aa83533847856e5945b52a150d6"
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
