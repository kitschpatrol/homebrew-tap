# Source: https://github.com/chen86860/homebrew-tap/blob/main/Casks/easy-complete.rb
cask "easy-complete-mirror" do
  version "2.9.0"
  sha256 "67c0e906b989625b4fe449995ffcacdc3434a254f53ed012e2f25737389f3c3f"

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
