class Msedit < Formula
  desc "Simple text editor with clickable interface"
  homepage "https://github.com/microsoft/edit"
  url "https://github.com/microsoft/edit/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "f35da309c5f3d92b10e5c4b2267e4d5e29d809b2aa460e80326b11f7feba72a5"
  license "MIT"

  depends_on "rust" => :build
  depends_on :macos # due to test failure on linux

  def install
    ENV["RUSTC_BOOTSTRAP"] = "1"
    system "cargo", "install", *std_cargo_args
  end

  test do
    # msedit is a TUI application
    assert_match version.to_s, shell_output("#{bin}/edit --version")
  end
end
