cask "lingon-pro" do
  version "10.1.2"
  sha256 "ccf68c54119a6a40d1ab233ad6502ce430c09c89f25443283b2a222a33d8c885"

  url "https://www.peterborgapps.com/downloads/LingonPro#{version.major}.zip"
  name "Lingon Pro"
  desc "Automator software to start apps, run scripts or commands and more"
  homepage "https://www.peterborgapps.com/lingon/"

  livecheck do
    url "https://www.peterborgapps.com/updates/lingonPro#{version.major}.plist"
    strategy :xml do |xml|
      xml.get_elements("//key[text()='version']").map { |item| item.next_element&.text&.strip }
    end
  end

  app "Lingon Pro.app"

  zap trash: [
    "~/Library/Application Scripts/com.peterborgapps.LingonPro*",
    "~/Library/Application Support/Lingon Pro",
    "~/Library/Containers/com.peterborgapps.LingonPro*",
  ]
end
