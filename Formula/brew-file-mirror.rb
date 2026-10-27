# Source: https://github.com/rcmdnk/homebrew-file/blob/HEAD/brew-file.rb
class BrewFileMirror < Formula
  desc "Brewfile manager for Homebrew"
  homepage "https://github.com/rcmdnk/homebrew-file/"
  url "https://github.com/rcmdnk/homebrew-file/archive/refs/tags/v10.2.2.tar.gz"
  sha256 "2669b27f3ec7a36ce84ac69aea5e248f2110f680027a402165d43c7f7a75d33a"
  license "MIT"

  head "https://github.com/rcmdnk/homebrew-file.git"

  livecheck do
    url :stable
    strategy :git
  end

  option "without-completions", "Disable bash/zsh completions"

  depends_on "python@3.13"

  conflicts_with "rcmdnk/file/brew-file", because: "both install brew-file binaries and brew-wrap scripts"

  def install
    bin.install "bin/brew-file"
    etc.install "etc/brew-wrap", "etc/brew-wrap.fish"
    if build.with? "completions"
      bash_completion.install "etc/bash_completion.d/brew-file"
      zsh_completion.install "share/zsh/site-functions/_brew-file"
    end
  end

  test do
    assert_match "Manager for packages of Homebrew", shell_output("#{bin}/brew-file --help")
  end
end
