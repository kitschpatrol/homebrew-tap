class Metascope < Formula
  desc "Easily extract metadata from all kinds of software repositories"
  homepage "https://github.com/kitschpatrol/metascope"
  url "https://registry.npmjs.org/metascope/-/metascope-0.13.6.tgz"
  sha256 "2cd6781f97e624e51559ea7dec5912b95bd235127d71974756d5b1d978c09279"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/metascope --version")
  end
end
