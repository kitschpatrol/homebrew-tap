cask "system-color-picker" do
  # "Updated once a year" at
  # https://sindresorhus.com/system-color-picker

  version "2.2.0"
  sha256 "ef68183ee750e98d0919b99009b802d8bb6f83ddd873414c3ab788a95855e6d4"

  # Dynamic URL from Non-App Store Version section
  # See https://github.com/orgs/Homebrew/discussions/5879
  def construct_url
    require "net/http"
    require "uri"

    uri = URI("https://sindresorhus.com/system-color-picker")
    response = Net::HTTP.get(uri)

    # Find the Non-App Store Version section and extract the download link
    # Look for <a href="...">Download</a>
    response.match(%r{<a\s+href="([^"]*)"[^>]*>Download</a>}i)[1]
  end

  url construct_url,
      verified: "dropbox.com/"
  name "System Color Picker"
  desc "Native system color picker as an app with more features"
  homepage "https://sindresorhus.com/system-color-picker"

  livecheck do
    url :homepage
    regex(%r{<em>\((\d+(?:\.\d+)+)[^)]*\)</em>}i)
  end

  app "Color Picker.app"
end
