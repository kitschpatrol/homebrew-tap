cask "stacks" do
  version "1.0b1"
  sha256 "f8783a71ca2eef3431e8533e3757348ad297df9780b3a67b50be2e635a14fa72"

  url "https://morphing.cloud/hypercard/Stacks-v#{version}.zip"
  name "Stacks"
  desc "Run HyperCard stacks without an emulator"
  homepage "https://morphing.cloud/hypercard/"

  livecheck do
    url "https://morphing.cloud/hypercard/version.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: :sonoma

  app "Stacks.app"

  zap trash: "~/Library/Containers/cloud.morphing.Stacks"
end
