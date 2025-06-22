cask "simple-color-palette" do
  # "Updated once a year" at
  # https://sindresorhus.com/simple-color-palette

  version "1.0.1"
  sha256 "444de529ec48d67f7261b173726c0d31308a8ecd20ebc2f51988cb3311cd3170"

  # Dynamic URL - fetches from homepage
  def construct_url
    require "net/http"
    require "uri"
    require "cgi"

    uri = URI("https://sindresorhus.com/simple-color-palette")
    response = Net::HTTP.get(uri)
    CGI.unescapeHTML(
      response.match(%r{href="(https://www\.dropbox\.com/(?:.*?)/Simple-Color-Palette-(?:.*?)[^"]*)"}i)[1],
    )
  end

  url construct_url,
      verified: "dropbox.com/"
  name "Simple Color Palette"
  desc "View, create, and edit color palettes in the Simple Color Palette format"
  homepage "https://sindresorhus.com/simple-color-palette"

  livecheck do
    url :homepage
    regex(%r{<em>\(v?(\d+(?:\.\d+)+)\)</em>}i)
  end

  app "Simple Color Palette.app"
end
