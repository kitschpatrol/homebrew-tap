class Itson < Formula
  desc "Configuration-driven management of long-running interactive applications"
  homepage "https://github.com/kitschpatrol/itson"
  url "https://registry.npmjs.org/itson/-/itson-0.7.8.tgz"
  sha256 "05ac3676006332d972f39db44749cbc52daa8a3b964ef270d3ccd8bfde5a4a7e"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/itson --version")
  end
end
