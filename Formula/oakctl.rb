class Oakctl < Formula
  desc "Manage Luxonis OAK cameras"
  homepage "https://docs.luxonis.com/software-v3/oak-apps/oakctl"
  url "https://oakctl-releases.luxonis.com/data/0.31.0/darwin_arm64/oakctl"
  sha256 "13fad6ad5a17097948e82b0375abaf544aeb28e3a2004ec0ba11512fbe1ee514"

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
