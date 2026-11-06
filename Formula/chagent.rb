class Chagent < Formula
  desc "Generate and update changelogs from Git history with Codex or Claude"
  homepage "https://github.com/kitschpatrol/chagent"
  url "https://registry.npmjs.org/@kitschpatrol/chagent/-/chagent-0.3.0.tgz"
  sha256 "ad25c30e53594b31239d4b085e502448bd1e6bca6f13a84548b15bc45f128ec8"
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
