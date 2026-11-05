class Sv < Formula
  desc "CLI for creating and maintaining Svelte applications"
  homepage "https://svelte.dev/docs/cli"
  url "https://registry.npmjs.org/sv/-/sv-1.3.0.tgz"
  sha256 "71a2e9f4ad286ed39d3300731795e0e63520b76da03e74a090ac24651ed826e9"
  license "MIT"

  depends_on "node"

  conflicts_with "runit", because: "both install `sv` binaries"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sv --version")
  end
end
