cask "simple-color-palette" do
  # "Updated once a year" at
  # https://sindresorhus.com/simple-color-palette

  version "1.3.0"
  sha256 "dfd603eb528514c462220b3ef74e840bed9034e50d87f505a6d68a3b917265c2"

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
