cask "lunacy-morphing" do
  version "1.1.1"
  sha256 "b4db890f09de63acf80fc47510c194a4ee936809c5485bc06bfaa6bebc5abf39"

  url "https://morphing.cloud/lunacy/Lunacy-v#{version}.zip"
  name "Lunacy"
  desc "Play Lunatic Fringe, the classic After Dark space shooter"
  homepage "https://morphing.cloud/lunacy/"

  livecheck do
    url "https://morphing.cloud/lunacy/version.json"
    strategy :json do |json|
      json["version"]
    end
  end

  conflicts_with cask: "lunacy"
  depends_on macos: :ventura

  app "Lunacy.app"

  zap trash: "~/Library/Containers/cloud.morphing.Lunacy"
end
