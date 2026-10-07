class Itson < Formula
  desc "Configuration-driven management of long-running interactive applications"
  homepage "https://github.com/kitschpatrol/itson"
  url "https://registry.npmjs.org/itson/-/itson-0.7.7.tgz"
  sha256 "d071d0cc835bd3379a5149b50d4e65b0a979e727f9738c69b0f93a9950280654"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/itson --version")
  end
end
