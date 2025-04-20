cask "gifski" do
  # "Updated once a year" at
  # https://github.com/sindresorhus/Gifski

  version "2.23.0"
  sha256 "f292b1359e25af0a5b08e620d3c3d319c085beb443d440fbbfc69c1da6126ef3"

  # Dynamic URL...
  # See https://github.com/orgs/Homebrew/discussions/5879
  def construct_url
    require "net/http"
    require "uri"
    require "cgi"

    uri = URI("https://raw.githubusercontent.com/sindresorhus/Gifski/refs/heads/main/readme.md")
    response = Net::HTTP.get(uri)
    CGI.unescapeHTML(
      response.match(%r{\[Download\]\((https://github\.com/sindresorhus/meta/files/\d+/Gifski[._-].*?\.zip)\)}i)[1],
    )
  end

  url construct_url, verified: "github.com/"
  name "Gifski"
  desc "GUI for Gifski video to gif conversion library"
  homepage "https://gif.ski/"

  livecheck do
    url "https://github.com/sindresorhus/Gifski"
    strategy :github_latest
  end

  app "Gifski.app"
end
