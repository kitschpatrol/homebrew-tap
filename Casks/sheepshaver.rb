cask "sheepshaver" do
  version "2.5,20260717"
  sha256 "678c6f54a127f71107df46c189f5c6ec3f18110ea90a708d56b1b40f5c752383"

  url "https://www.emaculation.com/sheepshaver/SheepShaver_universal_#{version.csv.second}.zip"
  name "SheepShaver"
  desc "Classic Macintosh emulator"
  homepage "https://sheepshaver.cebix.net/"

  livecheck do
    skip "No version information available"
  end

  depends_on cask: "sheepshaver-folder"
  depends_on :macos

  app "SheepShaver.app", target: "/Applications/SheepShaver/SheepShaver.app"

  caveats <<~EOS
    If upgrading from an October 2022 through January 2024 build, run
    the included preferences migration utility before launching SheepShaver:
      open "#{appdir}/SheepShaver/SheepShaver scripts/Correct prefs location.app"
  EOS
end
