class Metascope < Formula
  desc "Easily extract metadata from all kinds of software repositories"
  homepage "https://github.com/kitschpatrol/metascope"
  url "https://registry.npmjs.org/metascope/-/metascope-0.13.8.tgz"
  sha256 "a1674da8283ef4ea7af9de9733265ed5f3197b5c189ff804fd41cdbd6059b499"
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
