cask "machato" do
  version "1.9.4,31"
  sha256 "5b8a15c88e801c7d13f6087ed579aa2808c07d30df57c77b017686f0b9a9dbe5"

  url "https://machatoapp.github.io/Machato%20#{version.csv.first}.zip",
      verified: "machatoapp.github.io/"
  name "Machato"
  desc "Native client for ChatGPT and other LLMs"
  homepage "https://machato.app/"

  livecheck do
    url "https://machatoapp.github.io/appcast.xml"
    strategy :sparkle
  end

  depends_on :macos

  app "Machato.app"
end
