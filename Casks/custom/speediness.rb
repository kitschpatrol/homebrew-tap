cask "speediness" do
  version "2.0.0"
  sha256 "c87f72ca9f1ec9c5b61870cf14d396af99db76b261e43b8ced9758e656032949"

  # Dynamic URL...
  # See https://github.com/orgs/Homebrew/discussions/5879
  def construct_url
    require "net/http"
    require "uri"
    require "cgi"

    uri = URI("https://sindresorhus.com/speediness")
    response = Net::HTTP.get(uri)
    CGI.unescapeHTML(
      response.match(%r{href="(https://www\.dropbox\.com/(?:.*?)/Speediness-(?:.*?)[^"]*)"}i)[1],
    )
  end

  url construct_url,
      verified: "dropbox.com/"
  name "Speediness"
  desc "Check your internet speed"
  homepage "https://sindresorhus.com/speediness"

  livecheck do
    url :homepage
    regex(%r{Download</a>\s*<em>\((\d+\.\d+\.\d+)}ni)
  end

  app "Speediness.app"
end
