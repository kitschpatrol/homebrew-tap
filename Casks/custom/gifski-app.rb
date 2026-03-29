cask "gifski-app" do
  # "Updated once a year" at
  # https://github.com/sindresorhus/Gifski

  version "2.23.0"
  sha256 "f292b1359e25af0a5b08e620d3c3d319c085beb443d440fbbfc69c1da6126ef3"

  # Version at end of the url works around Homebrew's
  # insistence on skipping checksums on unversioned URLs.
  url "https://github.com/sindresorhus/meta/files/13539147/Gifski-2.23.0-1692807940.zip##{version}",
      verified: "github.com/"
  name "Gifski"
  desc "GUI for Gifski video to gif conversion library"
  homepage "https://gif.ski/"

  livecheck do
    url "https://github.com/sindresorhus/Gifski"
    strategy :github_latest
  end

  app "Gifski.app"
end
