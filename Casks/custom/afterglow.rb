cask "afterglow" do
  version "1.0.1"
  sha256 "f0b8a55af180bbcf1a6a08838129859ea831b9e9a582e0ad657fe7ee9951ddfd"

  url "https://morphing.cloud/afterglow/Afterglow-v#{version}.dmg"
  name "Afterglow"
  desc "Emulator for classic After Dark screen savers"
  homepage "https://morphing.cloud/afterglow/"

  livecheck do
    url "https://morphing.cloud/afterglow/appcast.xml"
    strategy :sparkle do |items|
      items.find { |item| item.channel.nil? }&.short_version
    end
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Afterglow.app"

  zap trash: "~/Library/Containers/cloud.morphing.afterglow"
end
