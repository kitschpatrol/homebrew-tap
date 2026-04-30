cask "gifski-app223" do
  # Last Sequoia-compatible release
  version "2.23.0"
  sha256 "bfa4891464b76be9f306a3e8200b7873c70d2ad90575653575993c08793bf364"

  url "https://github.com/sindresorhus/Gifski/releases/download/v#{version}/Gifski.#{version}.-.macOS.13.zip",
      verified: "github.com/sindresorhus/Gifski/"
  name "Gifski"
  desc "GUI for Gifski video to gif conversion library"
  homepage "https://sindresorhus.com/gifski"

  livecheck do
    skip "Pinned version"
  end

  depends_on macos: [:ventura, :sonoma, :sequoia]

  app "Gifski.app"
end
