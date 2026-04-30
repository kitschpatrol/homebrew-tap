cask "gifski-app" do
  # "Updated once a year" at
  # https://github.com/sindresorhus/Gifski

  version "3.0.0"
  sha256 "11f47f7a27edd7d0867e97f718c7a6dd3579df73a4d9f741f558d546a3cd61c9"

  # Version at end of the url works around Homebrew's
  # insistence on skipping checksums on unversioned URLs.
  url "https://www.dropbox.com/scl/fi/2i6entp1fj83zb16al3yf/Gifski-3.0.0-1777056640.zip?rlkey=ealuyayatxef5g61yl9240eyc&raw=1##{version}",
      verified: "dropbox.com/"
  name "Gifski"
  desc "GUI for Gifski video to gif conversion library"
  homepage "https://sindresorhus.com/gifski"

  livecheck do
    url "https://github.com/sindresorhus/Gifski"
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)+)$/)
  end

  depends_on macos: ">= :tahoe"

  app "Gifski.app"
end
