class Mdat < Formula
  desc "Markdown Autophagic Template (MDAT) system"
  homepage "https://github.com/kitschpatrol/mdat"
  url "https://registry.npmjs.org/mdat/-/mdat-3.4.0.tgz"
  sha256 "ba5d8b22fdaddc44c980eb247a48ae8e11dcede4236901583662c5a2cc2e0154"
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
