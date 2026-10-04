class Mdat < Formula
  desc "Markdown Autophagic Template (MDAT) system"
  homepage "https://github.com/kitschpatrol/mdat"
  url "https://registry.npmjs.org/mdat/-/mdat-3.5.0.tgz"
  sha256 "26e174d4a41be755290cb9ccb95fd6cec0e3fd8bdebe8fa5d55ed377f7d63a1a"
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
