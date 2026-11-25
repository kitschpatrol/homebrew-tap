class Sv < Formula
  desc "CLI for creating and maintaining Svelte applications"
  homepage "https://svelte.dev/docs/cli"
  url "https://registry.npmjs.org/sv/-/sv-1.7.1.tgz"
  sha256 "968d0022d9aa31aeaf80a347157d0caae3f60cfd8144ee670f3f65bf400d3a2d"
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
