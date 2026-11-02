class Vidup < Formula
  desc "Synchronize a local directory of video files to remote streaming services"
  homepage "https://github.com/kitschpatrol/vidup"
  url "https://registry.npmjs.org/vidup/-/vidup-1.0.21.tgz"
  sha256 "bb54f9b9e5379e095a4585816ff2e15ba5e6ab4deeca03dced8b6d429f94dc19"
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
