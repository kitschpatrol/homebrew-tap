cask "flashprint" do
  version "5.8.6"
  sha256 "5bcc20a5fa84643b369a90a669c8399bfc23b24dd630926e3a59332a71c8a103"

  # Version at end of the url is a dirty hack to work around Homebrew's
  # insistence on skipping checksums on unversioned URLs. ಠ_ಠ
  url "https://en.fss.flashforge.com/10000/software/f91bd24714e03006a0c064d626cfa699.zip##{version}"
  name "FlashPrint"
  desc "Slicer and print controller for Flashforge 3D printers"
  homepage "https://enterprise.flashforge.com/pages/flashprint"

  livecheck do
    skip "No version information available"
  end

  pkg "FlashPrint #{version.major}.pkg"

  uninstall pkgutil: "com.sz3dp.pkg.FlashPrint#{version.major}"

  zap trash: "~/Library/Preferences/FlashForge.FlashPrint.plist"
end
