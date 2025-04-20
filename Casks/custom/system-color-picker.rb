cask "system-color-picker" do
  # "Updated once a year" at
  # https://sindresorhus.com/system-color-picker

  version "2.1.0"
  sha256 "c4834ed4d4cbf3202de889f7c2d758e9e11b57bd64863db344079ed6c673e89e"

  # Dynamic URL...
  # See https://github.com/orgs/Homebrew/discussions/5879
  def construct_url
    require "net/http"
    require "uri"
    require "cgi"

    uri = URI("https://raw.githubusercontent.com/sindresorhus/System-Color-Picker/refs/heads/main/readme.md")
    response = Net::HTTP.get(uri)
    CGI.unescapeHTML(
      response.match(%r{\[Download\]\((https://www\.dropbox\.com/(?:.*?)/Color-Picker-(?:.*?)[^)]*)\)}i)[1],
    )
  end

  url construct_url, verified: "dropbox.com/"
  name "System Color Picker"
  desc "Native system color picker as an app with more features"
  homepage "https://sindresorhus.com/system-color-picker"

  livecheck do
    url "https://github.com/sindresorhus/system-color-picker"
    strategy :github_latest
  end

  app "Color Picker.app"
end
