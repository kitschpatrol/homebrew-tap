class Itson < Formula
  desc "Configuration-driven management of long-running interactive applications"
  homepage "https://github.com/kitschpatrol/itson"
  url "https://registry.npmjs.org/itson/-/itson-0.7.6.tgz"
  sha256 "b9943fa2477493b4bd324a0bcf6b6b7e70bb2b38588bf8e929e3e5bd3f77b9e8"
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
