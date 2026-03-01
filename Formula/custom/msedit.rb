class Msedit < Formula
  desc "Simple text editor with clickable interface"
  homepage "https://github.com/microsoft/edit"
  url "https://github.com/microsoft/edit/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "41c719b08212fa4ab6e434a53242b2718ba313e8d24d090f244bb857d6a9d0fd"
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
