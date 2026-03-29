cask "system-color-picker" do
  # "Updated once a year" at
  # https://sindresorhus.com/system-color-picker

  version "2.2.0"
  sha256 "bc31a7e3ae1d100c66227cc7f25efc836407c530181ae4a20933a47d9eb78a5b"

  # Version at end of the url works around Homebrew's
  # insistence on skipping checksums on unversioned URLs.
  url "https://www.dropbox.com/scl/fi/kk4c8p47uj791k5t0nj0n/Color-Picker-2.2.0-1767305140.zip?rlkey=jivahp9p4k5f24q76473zrnkd&raw=1##{version}",
      verified: "dropbox.com/"
  name "System Color Picker"
  desc "Native system color picker as an app with more features"
  homepage "https://sindresorhus.com/system-color-picker"

  livecheck do
    url :homepage
    regex(%r{<em>\((\d+(?:\.\d+)+)[^)]*\)</em>}i)
  end

  depends_on macos: ">= :tahoe"

  app "Color Picker.app"
end
