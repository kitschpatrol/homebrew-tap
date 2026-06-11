cask "gifski-app" do
  # The non-App Store build is published only as a Dropbox link in the
  # readme, "updated once a year". GitHub releases track the App Store
  # version, so livecheck must read the readme instead.
  version "3.0.1,1777713407,sz7f7zr673ii0kbm32v53,j6y2ehotb5ngbjbceg8qs8m1t"
  sha256 "39245d120ca4e39e086d808fbf3205411d5e5592d0f2829c0d8e77e0ae1fdf86"

  url "https://www.dropbox.com/scl/fi/#{version.csv.third}/Gifski-#{version.csv.first}-#{version.csv.second}.zip?rlkey=#{version.csv.fourth}&raw=1",
      verified: "dropbox.com/"
  name "Gifski"
  desc "GUI for Gifski video to gif conversion library"
  homepage "https://sindresorhus.com/gifski"

  livecheck do
    url "https://raw.githubusercontent.com/sindresorhus/Gifski/refs/heads/main/readme.md"
    regex(%r{dropbox\.com/scl/fi/([^/]+)/Gifski-(\d+(?:\.\d+)+)-(\d+)\.zip\?rlkey=(\w+)}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |file_id, ver, build, rlkey| "#{ver},#{build},#{file_id},#{rlkey}" }
    end
  end

  depends_on macos: :tahoe

  app "Gifski.app"
end
