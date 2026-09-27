class Mdat < Formula
  desc "Markdown Autophagic Template (MDAT) system"
  homepage "https://github.com/kitschpatrol/mdat"
  url "https://registry.npmjs.org/mdat/-/mdat-3.4.1.tgz"
  sha256 "94e431ca3e62bd22c21e875633123da924d1b5d04927960a9ef6a56bb56ae888"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mdat --version")
  end
end
