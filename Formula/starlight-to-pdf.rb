class StarlightToPdf < Formula
  desc "Convert Starlight documentation websites into PDF files"
  homepage "https://github.com/kitschpatrol/starlight-to-pdf"
  url "https://registry.npmjs.org/@kitschpatrol/starlight-to-pdf/-/starlight-to-pdf-2.0.0-beta.5.tgz"
  sha256 "92df8e44e3a74e8f710ab9145a2bda974be0bba2ef950f6264728c3f1375d80f"
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
