class Mdat < Formula
  desc "Markdown Autophagic Template (MDAT) system"
  homepage "https://github.com/kitschpatrol/mdat"
  url "https://registry.npmjs.org/mdat/-/mdat-3.6.1.tgz"
  sha256 "56d221ff11868ee9b374ea718568024b7e8e4ed1f94c3492fa7784f2f21ce253"
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
