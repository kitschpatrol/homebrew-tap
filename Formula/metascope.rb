class Metascope < Formula
  desc "Easily extract metadata from all kinds of software repositories"
  homepage "https://github.com/kitschpatrol/metascope"
  url "https://registry.npmjs.org/metascope/-/metascope-0.12.0.tgz"
  sha256 "229bffd7d1f1b8b23c2a72f4427474c25b823e250ef223d83ce0bbf388899093"
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
