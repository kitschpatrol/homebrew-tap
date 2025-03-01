cask "speediness" do
  version "1.8.0"
  sha256 "296348ebaf605022d95c8a1cce3536963e87f206f7fee5314eeb3a705af84c1e"

  # Dynamic URL...
  # See https://github.com/orgs/Homebrew/discussions/5879
  def construct_url
    require "net/http"
    require "uri"

    uri = URI("https://sindresorhus.com/speediness")
    response = Net::HTTP.get(uri)
    response.match(%r{href="(https://www\.dropbox\.com/(?:.*?)/Speediness-(?:.*?)[^"]*)"}i)[1]
  end

  url construct_url, verified: "dropbox.com/"
  name "Speediness"
  desc "Check your internet speed"
  homepage "https://sindresorhus.com/speediness"

  livecheck do
    url "https://sindresorhus.com/speediness"
    regex(%r{Download</a>\s*<em>\((\d+\.\d+\.\d+)}ni)
  end

  app "Speediness.app"
end
