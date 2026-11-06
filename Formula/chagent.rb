class Chagent < Formula
  desc "Generate and update changelogs from Git history with Codex or Claude"
  homepage "https://github.com/kitschpatrol/chagent"
  url "https://registry.npmjs.org/@kitschpatrol/chagent/-/chagent-0.5.0.tgz"
  sha256 "08d6163b542971bf09e6ef8f9761a61682c8c3fcdaf1cf6882608af2b761c90b"
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
