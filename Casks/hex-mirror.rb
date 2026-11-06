# Source: https://github.com/anomalyco/homebrew-tap/blob/HEAD/Casks/hex.rb
cask "hex-mirror" do
  version "3.3.0,c57106949a28a3d0767cc15505cd802638badeb0c18cfd06c57b130ab0d98859"
  sha256 "c57106949a28a3d0767cc15505cd802638badeb0c18cfd06c57b130ab0d98859"

  url "https://anoma.ly/release/hex/files/#{version.csv.second}/Hex.dmg"
  name "Hex"
  desc "Local voice dictation"
  homepage "https://anoma.ly/hex/"

  livecheck do
    url "https://anoma.ly/release/hex/desktop/stable.json"
    strategy :json do |json|
      version = json.dig("release", "version")
      checksum = json.dig("release", "targets", "macos-arm64-dmg", "sha256")
      next if version.blank? || checksum.blank?

      "#{version},#{checksum}"
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Hex.app"

  uninstall quit: "anomaly.hex"

  zap trash: [
    "~/.config/hex",
    "~/Library/Application Support/hex",
    "~/Library/Caches/anomaly.hex",
    "~/Library/HTTPStorages/anomaly.hex",
    "~/Library/Preferences/anomaly.hex.plist",
    "~/Library/Saved Application State/anomaly.hex.savedState",
  ]
end
