class Sv < Formula
  desc "CLI for creating and maintaining Svelte applications"
  homepage "https://svelte.dev/docs/cli"
  url "https://registry.npmjs.org/sv/-/sv-1.2.0.tgz"
  sha256 "1719f898db4f5847316655c46d733b32b3207543ee742996bfa271614acb621c"
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
