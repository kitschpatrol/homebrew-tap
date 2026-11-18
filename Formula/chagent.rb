class Chagent < Formula
  desc "Generate and update changelogs from Git history with Codex or Claude"
  homepage "https://github.com/kitschpatrol/chagent"
  url "https://registry.npmjs.org/@kitschpatrol/chagent/-/chagent-0.7.0.tgz"
  sha256 "ee56b35117229c5c875c5a99ec4edf02875e2b11734f14e09bd10a4f2769eb2b"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chagent --version")
  end
end
