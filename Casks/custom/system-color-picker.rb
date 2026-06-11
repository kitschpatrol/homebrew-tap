cask "system-color-picker" do
  # The app is only published as a Dropbox link on the homepage,
  # "updated once a year", so livecheck extracts the version and URL
  # components from there together to keep them from drifting apart.
  version "2.2.0,1767305140,kk4c8p47uj791k5t0nj0n,jivahp9p4k5f24q76473zrnkd"
  sha256 "bc31a7e3ae1d100c66227cc7f25efc836407c530181ae4a20933a47d9eb78a5b"

  url "https://www.dropbox.com/scl/fi/#{version.csv.third}/Color-Picker-#{version.csv.first}-#{version.csv.second}.zip?rlkey=#{version.csv.fourth}&raw=1",
      verified: "dropbox.com/"
  name "System Color Picker"
  desc "Native system color picker as an app with more features"
  homepage "https://sindresorhus.com/system-color-picker"

  livecheck do
    url :homepage
    regex(%r{dropbox\.com/scl/fi/([^/]+)/Color-Picker-(\d+(?:\.\d+)+)-(\d+)\.zip\?rlkey=(\w+)}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |file_id, ver, build, rlkey| "#{ver},#{build},#{file_id},#{rlkey}" }
    end
  end

  depends_on macos: :tahoe

  app "Color Picker.app"
end
