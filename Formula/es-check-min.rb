class EsCheckMin < Formula
  desc "Find the minimum compatible ECMAScript version of a JavaScript file"
  homepage "https://github.com/kitschpatrol/es-check-min"
  url "https://registry.npmjs.org/es-check-min/-/es-check-min-1.0.13.tgz"
  sha256 "3ce0d7f06a1422db02f77ed724f73a9d55912fd2d4802aae1e5dbebdcca55de2"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/es-check-min --version")
  end
end
