class Brewpub < Formula
  desc "Publish and update Homebrew formula to your custom tap"
  homepage "https://github.com/kitschpatrol/brewpub"
  url "https://registry.npmjs.org/brewpub/-/brewpub-0.3.1.tgz"
  sha256 "0be3f99a98927ae4f523fc68e35f55c34d51a7a3312d0b96d1f3287bf45b0e81"
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
