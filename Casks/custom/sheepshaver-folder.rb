cask "sheepshaver-folder" do
  # See https://www.emaculation.com/forum/viewtopic.php?f=20&t=7360
  # Versioning ambiguous, this is creation date of folder
  version "2020.01.16"
  sha256 "ac714fed65354dc337026653d2e842ed9183ac93cc547ca46d26e531baad811f"

  # Version at end of the url works around Homebrew's
  # insistence on skipping checksums on unversioned URLs.
  url "https://ronaldpr.home.xs4all.nl/sheepshaverforum/SheepShaver_folder.zip##{version}",
      verified: "ronaldpr.home.xs4all.nl/"
  name "SheepShaver Folder"
  desc "Suite folder for SheepShaver"
  homepage "https://www.emaculation.com/forum/viewtopic.php?t=2409&sid=58500b8de126979a6abb9f38b3ffbd8b"

  livecheck do
    skip "No version information available"
  end

  suite "SheepShaver"

  zap trash: "/Applications/SheepShaver"
end
