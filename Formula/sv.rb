class Sv < Formula
  desc "CLI for creating and maintaining Svelte applications"
  homepage "https://svelte.dev/docs/cli"
  url "https://registry.npmjs.org/sv/-/sv-1.1.1.tgz"
  sha256 "ff90cd81de0e824b2716c086811b5c5208d5ed44e9eec7ed7818298903234284"
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
