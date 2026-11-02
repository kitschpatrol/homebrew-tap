class EsCheckMin < Formula
  desc "Find the minimum compatible ECMAScript version of a JavaScript file"
  homepage "https://github.com/kitschpatrol/es-check-min"
  url "https://registry.npmjs.org/es-check-min/-/es-check-min-1.0.14.tgz"
  sha256 "0aa98382b82d4591aa35f1c5860abc69b43a66954ea6ec05f799d58f7a633f61"
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
