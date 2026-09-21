class Vidup < Formula
  desc "Synchronize a local directory of video files to remote streaming services"
  homepage "https://github.com/kitschpatrol/vidup"
  url "https://registry.npmjs.org/vidup/-/vidup-1.0.19.tgz"
  sha256 "2dd902c1fddb51bf8d7d2051af6a21a1f0585ec16eee2a6308a15824179de07b"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vidup --version")
  end
end
