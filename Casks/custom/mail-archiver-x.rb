cask "mail-archiver-x" do
  version "8.2.2"
  sha256 "2b0d54fccba08b94af9438c3b33a7728d5465c0982791ae5e36b1fa462c3e81a"

  url "https://mailarchiver.b-cdn.net/MailArchiverX#{version}.dmg",
      verified: "mailarchiver.b-cdn.net/"
  name "Mail Archiver X"
  desc "Archive your email"
  homepage "https://www.mothsoftware.com/content/content/mailarchiverx.php"

  livecheck do
    url "https://www.mothsoftware.com/content/downloadsuccess/success.php"
    regex(/MailArchiverX(\d+(?:\.\d+)+)\.dmg/i)
  end

  depends_on :macos

  suite "Mail Archiver X Installer.app/Contents/Helpers", target: "Mail Archiver X"

  postflight do
    templates_path = "#{Dir.home}/Documents/Mail Archiver X"
    template_path = "#{templates_path}/Standard Template.html"

    unless File.exist?(template_path)
      system_command "/bin/mkdir", args: ["-p", templates_path]
      system_command "/usr/bin/ditto",
                     args: [
                       "#{staged_path}/Mail Archiver X Installer.app/Contents/Resources/Standard Template.html",
                       template_path,
                     ]
    end
  end

  uninstall launchctl: "com.mothsoftware.mailarchiverx-helper.launchd",
            quit:      [
              "com.mothsoftware.mailarchiverx",
              "com.mothsoftware.mailarchiverx-helper",
            ]

  zap trash: [
    "~/Library/Application Support/.MailArchiverX5",
    "~/Library/Application Support/Mail Archiver X",
    "~/Library/Preferences/com.mothsoftware.mailarchiverx.plist",
  ]
end
