class Metascope < Formula
  desc "Easily extract metadata from all kinds of software repositories"
  homepage "https://github.com/kitschpatrol/metascope"
  url "https://registry.npmjs.org/metascope/-/metascope-0.13.7.tgz"
  sha256 "468e26eca9f8c7b8c5408a243bae946e86f99f196c3c8adfeea88bfd33c30ea8"
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
