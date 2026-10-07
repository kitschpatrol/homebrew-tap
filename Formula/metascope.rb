class Metascope < Formula
  desc "Easily extract metadata from all kinds of software repositories"
  homepage "https://github.com/kitschpatrol/metascope"
  url "https://registry.npmjs.org/metascope/-/metascope-0.12.2.tgz"
  sha256 "50137fef3365a1360ca4a5ff1a626639c8e42fcab24ef964ffabf8d49665902b"
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
