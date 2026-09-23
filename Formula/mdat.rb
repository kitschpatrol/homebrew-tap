class Mdat < Formula
  desc "Markdown Autophagic Template (MDAT) system"
  homepage "https://github.com/kitschpatrol/mdat"
  url "https://registry.npmjs.org/mdat/-/mdat-3.3.0.tgz"
  sha256 "f2f92c005fc5e6342eefba1fb3730840a332b1fb4a4a8dde52b56e4da0ed5c3f"
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
