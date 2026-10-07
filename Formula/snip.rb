class Snip < Formula
  desc "Snippet management"
  homepage "https://github.com/kitschpatrol/snip"
  url "https://registry.npmjs.org/@kitschpatrol/snip/-/snip-0.0.16.tgz"
  sha256 "b3e06c2fa5eee0b846f42293baf5d21780b78318d1790451387956bb873ad9fb"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/snip --version")
  end
end
