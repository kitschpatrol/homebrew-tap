class Vidup < Formula
  desc "Synchronize a local directory of video files to remote streaming services"
  homepage "https://github.com/kitschpatrol/vidup"
  url "https://registry.npmjs.org/vidup/-/vidup-1.0.20.tgz"
  sha256 "66b62b29405dacb15e3a91a58876d7d5ec0c0c5c1b576ae5cb6c3aef88258f37"
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
