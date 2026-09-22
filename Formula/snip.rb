class Snip < Formula
  desc "Snippet management"
  homepage "https://github.com/kitschpatrol/snip"
  url "https://registry.npmjs.org/@kitschpatrol/snip/-/snip-0.0.15.tgz"
  sha256 "9bba3b3601638e748837d2713cd34a9682197409e5e181636fb0d6cfca64a90c"
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
