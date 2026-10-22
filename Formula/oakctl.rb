class Oakctl < Formula
  desc "Manage Luxonis OAK cameras"
  homepage "https://docs.luxonis.com/software-v3/oak-apps/oakctl"
  url "https://oakctl-releases.luxonis.com/data/0.31.1/darwin_arm64/oakctl"
  sha256 "54aff87891c096e7d743d089b69960f72621307f1f94572ca5e7a07de88fbe96"

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
