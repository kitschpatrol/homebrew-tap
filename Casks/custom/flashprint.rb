cask "flashprint" do
  version "5.8.7"
  sha256 "52fe24c31226eb0a4e064feb0a4ca54fd376f61f87ba186a5536eca8c3b80eb7"

  url "https://flashforge-resource.oss-us-east-1.aliyuncs.com/FlashPrint_#{version}/FlashPrint_#{version}_mac%20%28new%29.zip"
  name "FlashPrint"
  desc "Slicer and print controller for Flashforge 3D printers"
  homepage "https://www.flashforge.com/pages/software-flashprint"

  livecheck do
    url "https://www.flashforge.com/blogs/download-center/software"
    regex(/FlashPrint[._-]v?(\d+(?:\.\d+)+)_mac/i)
  end

  depends_on :macos

  pkg "FlashPrint-#{version}.pkg"

  uninstall pkgutil: "com.sz3dp.pkg.FlashPrint#{version.major}"

  zap trash: "~/Library/Preferences/FlashForge.FlashPrint.plist"
end
