class Sv < Formula
  desc "CLI for creating and maintaining Svelte applications"
  homepage "https://svelte.dev/docs/cli"
  url "https://registry.npmjs.org/sv/-/sv-1.4.0.tgz"
  sha256 "15a61120e54233e6b405fe27228c08b310e7c6262d499abfa0aafd2b3df5fd1e"
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
