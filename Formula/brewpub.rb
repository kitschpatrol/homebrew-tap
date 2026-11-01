class Brewpub < Formula
  desc "Publish and update Homebrew formula to your custom tap"
  homepage "https://github.com/kitschpatrol/brewpub"
  url "https://registry.npmjs.org/brewpub/-/brewpub-0.5.1.tgz"
  sha256 "82d902a1fce9963661ae8360147288b19e8221a19ed1d1a4ddddf8829a02c0d9"
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
