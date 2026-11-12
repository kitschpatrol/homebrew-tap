class Chagent < Formula
  desc "Generate and update changelogs from Git history with Codex or Claude"
  homepage "https://github.com/kitschpatrol/chagent"
  url "https://registry.npmjs.org/@kitschpatrol/chagent/-/chagent-0.6.0.tgz"
  sha256 "b067046cd17dbea6f2cb4178860a516c0023deb3ad7bd3ef4ff830aac2efe2c1"
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
