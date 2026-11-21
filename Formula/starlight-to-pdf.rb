class StarlightToPdf < Formula
  desc "Convert Starlight documentation websites into PDF files"
  homepage "https://github.com/kitschpatrol/starlight-to-pdf"
  url "https://registry.npmjs.org/@kitschpatrol/starlight-to-pdf/-/starlight-to-pdf-2.0.0-beta.6.tgz"
  sha256 "a1ee3aa61111b4e10f665fa58212a6616b4c6f4d1ef8bd6d1d164af41c9d7fba"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/starlight-to-pdf --version")
  end
end
