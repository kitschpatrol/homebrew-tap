cask "simple-color-palette" do
  # The app is only published as a Dropbox link on the homepage,
  # "updated once a year", so livecheck extracts the version and URL
  # components from there together to keep them from drifting apart.
  version "1.3.1,1775986497,bbpfawkllfq81gw2xvksl,di7lacf9mdqhozck8tl37am9m"
  sha256 "71dd98b29a8eb71a59b8f28a21a619529c9e1081d335a65554de7a2a9969888a"

  url "https://www.dropbox.com/scl/fi/#{version.csv.third}/Simple-Color-Palette-#{version.csv.first}-#{version.csv.second}.zip?rlkey=#{version.csv.fourth}&raw=1",
      verified: "dropbox.com/"
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
