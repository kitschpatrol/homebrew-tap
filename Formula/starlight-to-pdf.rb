class StarlightToPdf < Formula
  desc "Convert Starlight documentation websites into PDF files"
  homepage "https://github.com/kitschpatrol/starlight-to-pdf"
  url "https://registry.npmjs.org/@kitschpatrol/starlight-to-pdf/-/starlight-to-pdf-2.0.0-beta.4.tgz"
  sha256 "53391aee152b49bc4c2c1dc93949c210518e1eac179d56f115887bb5c609672d"
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
