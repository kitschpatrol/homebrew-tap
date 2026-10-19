# @case-police-ignore MacOS
cask "math-reduce" do
  version "1.0.0"
  sha256 "8973b98fd5033b9ca8d2b8ec07f365475137090c0b935bf48d734b8759cdc2c3"

  url "https://github.com/kitschpatrol/math-reduce/releases/download/v#{version}/MathReduce-#{version}-universal.dmg"
  name "Math Reduce"
  desc "System-wide service to turn any text field into a calculator"
  homepage "https://github.com/kitschpatrol/math-reduce"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  service "MathReduce.service"

  uninstall quit: "com.kitschpatrol.MathReduce"

  caveats <<~EOS
    To refresh the Services menu after installation, run:
      "#{cask.config.servicedir}/MathReduce.service/Contents/MacOS/MathReduce" --refresh-services

    If Math Reduce does not appear in the Services menu, enable it in
    System Settings > Keyboard > Keyboard Shortcuts > Services.
  EOS
end
