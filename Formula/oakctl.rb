class Oakctl < Formula
  desc "Command-line tool for managing Luxonis OAK cameras"
  homepage "https://docs.luxonis.com/software-v3/oak-apps/oakctl"
  url "https://oakctl-releases.luxonis.com/data/0.27.0/darwin_arm64/oakctl"
  sha256 "e06f918659fd89d53f53b36912fa96abe97ba7f9e2c61e449850dedbfa5e6a42"

  livecheck do
    url "https://oakctl-releases.luxonis.com/version"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "oakctl"
  end

  def caveats
    <<~EOS
      oakctl ships with a `self-update` command, but this copy is managed by
      Homebrew. Update it with `brew upgrade oakctl` instead of `oakctl
      self-update`, which would overwrite the Homebrew-tracked binary.

      Running oakctl stores state and configuration in:
        ~/Library/Application Support/com.luxonis.oakctl
      `brew uninstall oakctl` does not remove this. To delete it too, run:
        rm -rf ~/"Library/Application Support/com.luxonis.oakctl"
    EOS
  end

  test { assert_match version.to_s, shell_output("#{bin}/oakctl --version") }
end
