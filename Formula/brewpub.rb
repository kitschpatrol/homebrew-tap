class Brewpub < Formula
  desc "Publish and update Homebrew formula to your custom tap"
  homepage "https://github.com/kitschpatrol/brewpub"
  url "https://registry.npmjs.org/brewpub/-/brewpub-0.4.0.tgz"
  sha256 "acbc3fcff3fe106493d7729c1a5f3ceb264d6a1dbd84f19c94592bca3f386673"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/brewpub --version")
  end
end
