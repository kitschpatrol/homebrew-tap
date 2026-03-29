cask "speediness181" do
  version "1.8.1"
  sha256 "c87f72ca9f1ec9c5b61870cf14d396af99db76b261e43b8ced9758e656032949"

  # Version at end of the url works around Homebrew's
  # insistence on skipping checksums on unversioned URLs.
  url "https://www.dropbox.com/scl/fi/84jjd5hqfhdp9sv76jb9a/Speediness-1.8.1-macOS-15-1770360327.zip?rlkey=v8tc9r4r7iz9kqfjyksfdwri2&raw=1##{version}",
      verified: "dropbox.com/"
  name "Speediness"
  desc "Check your internet speed"
  homepage "https://sindresorhus.com/speediness"

  livecheck do
    skip "Pinned version"
  end

  depends_on macos: ">= :sequoia"

  app "Speediness.app"
end
