cask "simple-color-palette" do
  # "Updated once a year" at
  # https://sindresorhus.com/simple-color-palette

  version "1.3.0"
  sha256 "e0234fe8fc41837a934189ab31b4bda51618191455d8b8070bd5fcfd73bf2808"

  # Version at end of the url works around Homebrew's
  # insistence on skipping checksums on unversioned URLs.
  url "https://www.dropbox.com/scl/fi/z9kdudx71b6zkryxdm6oy/Simple-Color-Palette-1.3.0-1772815584.zip?rlkey=z36l3zkwsy4zx0dq9jv4zg9lo&raw=1##{version}",
      verified: "dropbox.com/"
  name "Simple Color Palette"
  desc "View, create, and edit color palettes in the Simple Color Palette format"
  homepage "https://sindresorhus.com/simple-color-palette"

  livecheck do
    url :homepage
    regex(%r{<em>\(v?(\d+(?:\.\d+)+)\)</em>}i)
  end

  depends_on macos: ">= :tahoe"

  app "Simple Color Palette.app"
end
