cask "speediness" do
  # The app is only published as a Dropbox link on the homepage, so
  # livecheck extracts the version and URL components from there
  # together to keep them from drifting apart.
  version "2.0.0,1770359964,xt04xgqt32n6ekqdao10b,d16dzbs51ys756sb2cw49merv"
  sha256 "7f962621d20684ad10e976420e46d712040d14631225b564b414a9f19f790119"

  url "https://www.dropbox.com/scl/fi/#{version.csv.third}/Speediness-#{version.csv.first}-#{version.csv.second}.zip?rlkey=#{version.csv.fourth}&raw=1",
      verified: "dropbox.com/"
  name "Speediness"
  desc "Check your internet speed"
  homepage "https://sindresorhus.com/speediness"

  livecheck do
    url :homepage
    regex(%r{dropbox\.com/scl/fi/([^/]+)/Speediness-(\d+(?:\.\d+)+)-(\d+)\.zip\?rlkey=(\w+)}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |file_id, ver, build, rlkey| "#{ver},#{build},#{file_id},#{rlkey}" }
    end
  end

  depends_on macos: :tahoe

  app "Speediness.app"
end
