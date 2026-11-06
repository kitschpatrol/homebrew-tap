class Chagent < Formula
  desc "Generate and update changelogs from Git history with Codex or Claude"
  homepage "https://github.com/kitschpatrol/chagent"
  url "https://registry.npmjs.org/@kitschpatrol/chagent/-/chagent-0.2.0.tgz"
  sha256 "b964a9c72c9387ae89231e58ba2a6f3ceed6f1548ac02081da6b1c5c8768128c"
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
