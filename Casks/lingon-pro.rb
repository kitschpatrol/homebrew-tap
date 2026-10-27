cask "lingon-pro" do
  version "10.3.1"
  sha256 "b980cf48b45792c34df1de8304729f43f053883b10d3aa694b13ed294d39de21"

  url "https://www.peterborgapps.com/downloads/LingonPro#{version.major}.zip"
  name "Lingon Pro"
  desc "Automator software to start apps, run scripts or commands and more"
  homepage "https://www.peterborgapps.com/lingon/"

  livecheck do
    url :url
    strategy :extract_plist do |items|
      items["com.peterborgapps.LingonPro10"].short_version
    end
  end

  depends_on macos: :sonoma

  app "Lingon Pro.app"

  zap trash: [
    "~/Library/Application Scripts/com.peterborgapps.LingonPro*",
    "~/Library/Application Support/Lingon Pro",
    "~/Library/Containers/com.peterborgapps.LingonPro*",
  ]
end
