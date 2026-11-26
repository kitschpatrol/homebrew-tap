# Source: https://github.com/anomalyco/homebrew-tap/blob/HEAD/Casks/hex.rb
cask "hex-mirror" do
  version "3.5.0,fd4892a9c72185effc00639cb3f2c723d24b7850ca89ac57cc69b068a2d64312"
  sha256 "fd4892a9c72185effc00639cb3f2c723d24b7850ca89ac57cc69b068a2d64312"

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
