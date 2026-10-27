# Source: https://github.com/epk/homebrew-epk/blob/HEAD/Casks/font-sf-mono-nerd-font.rb
cask "font-sf-mono-nerd-font-mirror" do
  version "18.0d1e1.0"
  sha256 "99ef85be142350490cbcd9383dab4d86575fa330db1ca8b57b3b21ab7b8bf2f7"

  url "https://github.com/epk/SF-Mono-Nerd-Font/archive/refs/tags/v#{version}.tar.gz"
  name "SF Mono Nerd Font"
  desc "Apple SF Mono patched with Nerd Font glyphs"
  homepage "https://github.com/epk/SF-Mono-Nerd-Font"

  livecheck do
    url :url
    regex(/^v?(\d[\da-z.]*)$/i)
    strategy :github_latest
  end

  font "SF-Mono-Nerd-Font-#{version}/SFMono Bold Italic Nerd Font Complete.otf"
  font "SF-Mono-Nerd-Font-#{version}/SFMono Bold Nerd Font Complete.otf"
  font "SF-Mono-Nerd-Font-#{version}/SFMono Heavy Italic Nerd Font Complete.otf"
  font "SF-Mono-Nerd-Font-#{version}/SFMono Heavy Nerd Font Complete.otf"
  font "SF-Mono-Nerd-Font-#{version}/SFMono Light Italic Nerd Font Complete.otf"
  font "SF-Mono-Nerd-Font-#{version}/SFMono Light Nerd Font Complete.otf"
  font "SF-Mono-Nerd-Font-#{version}/SFMono Medium Italic Nerd Font Complete.otf"
  font "SF-Mono-Nerd-Font-#{version}/SFMono Medium Nerd Font Complete.otf"
  font "SF-Mono-Nerd-Font-#{version}/SFMono Regular Italic Nerd Font Complete.otf"
  font "SF-Mono-Nerd-Font-#{version}/SFMono Regular Nerd Font Complete.otf"
  font "SF-Mono-Nerd-Font-#{version}/SFMono Semibold Italic Nerd Font Complete.otf"
  font "SF-Mono-Nerd-Font-#{version}/SFMono Semibold Nerd Font Complete.otf"
end
