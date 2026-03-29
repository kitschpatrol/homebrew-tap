cask "system-color-picker214" do
  version "2.1.4"
  sha256 "a9b46978eca5af80a37b010c938cc1abe6e1fa4a22d961d6b2dad458b765aac9"

  url "https://github.com/sindresorhus/System-Color-Picker/releases/download/older-releases/Color.Picker.#{version}.-.macOS.15.zip",
      verified: "github.com/sindresorhus/System-Color-Picker/"
  name "System Color Picker"
  desc "Native system color picker as an app with more features"
  homepage "https://sindresorhus.com/system-color-picker"

  livecheck do
    skip "Pinned version"
  end

  depends_on macos: ">= :sequoia"

  app "Color Picker.app"
end
