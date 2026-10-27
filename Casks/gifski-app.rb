cask "gifski-app" do
  # The non-App Store build is published only as a Dropbox link in the
  # readme, "updated once a year". GitHub releases track the App Store
  # version, so livecheck must read the readme instead.
  version "3.0.3,1781358496,kavioam2qu6feughgznl7,2yk36qdq3t7jitmdmptakh6si"
  sha256 "8e4c2d85902add0a9d149ac85d26ffc5c42bfb498066d4ee7abf952e15df50ed"

  url "https://www.dropbox.com/scl/fi/#{version.csv.third}/Gifski-#{version.csv.second}.zip?rlkey=#{version.csv.fourth}&raw=1"
  name "Gifski"
  desc "GUI for Gifski video to gif conversion library"
  homepage "https://sindresorhus.com/gifski"

  livecheck do
    url "https://raw.githubusercontent.com/sindresorhus/Gifski/refs/heads/main/readme.md"
    regex(%r{dropbox\.com/scl/fi/([^/]+)/Gifski-(\d+)\.zip\?rlkey=(\w+)[^\n]*?\((\d+(?:\.\d+)+)\s}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |file_id, build, rlkey, ver| "#{ver},#{build},#{file_id},#{rlkey}" }
    end
  end

  depends_on macos: :tahoe

  app "Gifski.app"
end
