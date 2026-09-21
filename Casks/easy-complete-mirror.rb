# Source: https://github.com/chen86860/homebrew-tap/blob/main/Casks/easy-complete.rb
cask "easy-complete-mirror" do
  version "2.3.4"
  sha256 "5fc5f3bbc23e3f4357d3ed0d548075772c861a76016b42ecbd36f719a087793d"

  url "https://github.com/chen86860/easy-complete/releases/download/v#{version}/Easy-Complete-arm64.dmg"
  name "Easy Complete"
  desc "IDE-style inline autocomplete for terminals"
  homepage "https://easy-complete.emmmm.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Easy Complete.app"

  uninstall quit: "dev.emmmm.easy-complete"

  zap trash: [
    "~/.local/bin/ec",
    "~/.local/bin/ecterm",
    "~/.local/share/easy-complete",
    "~/Library/Application Support/easy-complete",
    "~/Library/Input Methods/EasyCompleteInputMethod.app",
    "~/Library/LaunchAgents/dev.emmmm.easy-complete.plist",
    "~/Library/Preferences/dev.emmmm.easy-complete.inputmethod.plist",
    "~/Library/Preferences/dev.emmmm.easy-complete.plist",
  ]
end
