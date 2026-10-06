class StarlightToPdf < Formula
  desc "Convert Starlight documentation websites into PDF files"
  homepage "https://github.com/kitschpatrol/starlight-to-pdf"
  url "https://registry.npmjs.org/@kitschpatrol/starlight-to-pdf/-/starlight-to-pdf-2.0.0-beta.3.tgz"
  sha256 "778118f9c2812ec5cbb353d40980b2c9b5ca30f217a145867b30a9097f380d33"
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
