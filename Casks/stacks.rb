cask "stacks" do
  version "1.0a19"
  sha256 "4130fac353775bdea2b4a932ed0f0c8f0accb4516f19b0163a667ec2f4c97245"

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
