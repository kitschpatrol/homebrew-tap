cask "sheepshaver-folder" do
  version "2024"
  sha256 "d93db35fd81d53fe4f9a9c3777c0988c3a55677d48b2f8c663d9272a96552914"

  url "https://www.emaculation.com/sheepshaver/SheepShaver_folder_#{version}.zip"
  name "SheepShaver Folder"
  desc "Suite folder for SheepShaver"
  homepage "https://www.emaculation.com/forum/viewtopic.php?t=7360"

  livecheck do
    skip "No version information available"
  end

  depends_on :macos

  suite "SheepShaver"

  preflight_steps do
    # Homebrew moves the previous suite here before installing its replacement.
    # Retain user disks, ROMs and the separately managed emulator without replacing new utilities.
    if_path_exists "{{caskroom_path}}/*.upgrading/SheepShaver" do
      move "SheepShaver", "SheepShaver-updated", target_base: :temp
      copy "{{caskroom_path}}/*.upgrading/SheepShaver", "SheepShaver", recursive: true, source_glob: true
      run "/usr/bin/ditto", args: ["{{temp}}/SheepShaver-updated", "{{staged_path}}/SheepShaver"]
    end
  end

  zap trash: "/Applications/SheepShaver"
end
