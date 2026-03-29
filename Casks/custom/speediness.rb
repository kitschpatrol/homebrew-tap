cask "speediness" do
  version "2.0.0"
  sha256 "7f962621d20684ad10e976420e46d712040d14631225b564b414a9f19f790119"

  # Version at end of the url works around Homebrew's
  # insistence on skipping checksums on unversioned URLs.
  url "https://www.dropbox.com/scl/fi/xt04xgqt32n6ekqdao10b/Speediness-2.0.0-1770359964.zip?rlkey=d16dzbs51ys756sb2cw49merv&raw=1##{version}",
      verified: "dropbox.com/"
  name "Speediness"
  desc "Check your internet speed"
  homepage "https://sindresorhus.com/speediness"

  livecheck do
    url :homepage
    regex(%r{Download</a>\s*<em>\((\d+\.\d+\.\d+)}ni)
  end

  depends_on macos: ">= :tahoe"

  app "Speediness.app"
end
