class Brewpub < Formula
  desc "Publish and update Homebrew formula to your custom tap"
  homepage "https://github.com/kitschpatrol/brewpub"
  url "https://registry.npmjs.org/brewpub/-/brewpub-0.5.0.tgz"
  sha256 "0c2890e46def6b8f958285badd51c3048d24bd0b4077805b32c5cbd2badb8c81"
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
