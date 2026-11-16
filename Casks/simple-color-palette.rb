cask "simple-color-palette" do
  # The app is only published as a Dropbox link on the homepage,
  # "updated once a year", so livecheck extracts the version and URL
  # components from there together to keep them from drifting apart.
  version "1.4.0,1794507830,ncj0f7zrozh6v5a5arp7d,dzajyc5h070k71xyxa5o36ae3"
  sha256 "fd283722a30600bbea6bb362107d0c3fe70bdf9f5773f503205e11b601acb2a9"

  url "https://www.dropbox.com/scl/fi/#{version.csv.third}/Simple-Color-Palette-#{version.csv.first}-#{version.csv.second}.zip?rlkey=#{version.csv.fourth}&raw=1"
  name "Simple Color Palette"
  desc "View, create, and edit color palettes in the Simple Color Palette format"
  homepage "https://sindresorhus.com/simple-color-palette"

  livecheck do
    url :homepage
    regex(%r{dropbox\.com/scl/fi/([^/]+)/Simple-Color-Palette-(\d+(?:\.\d+)+)-(\d+)\.zip\?rlkey=(\w+)}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |file_id, ver, build, rlkey| "#{ver},#{build},#{file_id},#{rlkey}" }
    end
  end

  depends_on macos: :tahoe

  app "Simple Color Palette.app"
end
