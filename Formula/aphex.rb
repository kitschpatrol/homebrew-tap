class Aphex < Formula
  desc "Apple Photos Export"
  homepage "https://github.com/kitschpatrol/aphex"
  url "https://registry.npmjs.org/@kitschpatrol/aphex/-/aphex-0.1.5.tgz"
  sha256 "a5ce130288b9cc94ccdeb0a4f9ae784efb0afc2e473b27461e5935120dc45216"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aphex --version")
  end
end
