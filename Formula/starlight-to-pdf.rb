class StarlightToPdf < Formula
  desc "Convert Starlight documentation websites into PDF files"
  homepage "https://github.com/kitschpatrol/starlight-to-pdf"
  url "https://registry.npmjs.org/@kitschpatrol/starlight-to-pdf/-/starlight-to-pdf-2.0.0-beta.2.tgz"
  sha256 "bc006a871f0975f256ce53daaba3955d82a708b6df1846ec5bf82bc722002f3e"
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
