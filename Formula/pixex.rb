class Pixex < Formula
  desc "Pixelmator Export"
  homepage "https://github.com/kitschpatrol/pixex"
  url "https://registry.npmjs.org/pixex/-/pixex-0.2.0.tgz"
  sha256 "98b2fb13463a8005238f17d61ef621baecc676996b3bcae8c6e451474afa9696"
  license "MIT"

  depends_on :macos
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pixex --version")
  end
end
