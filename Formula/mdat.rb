class Mdat < Formula
  desc "Turn comments into content in Markdown files"
  homepage "https://github.com/kitschpatrol/mdat"
  url "https://registry.npmjs.org/mdat/-/mdat-3.6.7.tgz"
  sha256 "a90e503eecb7c9792ad6402ec9d413488b310dd9ba263839616301e3dafda809"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mdat --version")
  end
end
