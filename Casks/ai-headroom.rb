# Homebrew cask for Headroom, published to ScaleXY/homebrew-tap by .github/workflows/release.yml.
# The workflow fills in version and sha256 for each tagged release; the rest is maintained here.
# Not "headroom": homebrew/cask has an unrelated app by that name, also installed as Headroom.app.
cask "ai-headroom" do
  version "0.1.3"
  sha256 "78bcad05fc3d32fdc78979fb8c6b00f1adb79f8596c052c75540d7a0d3c519b3"

  url "https://github.com/ScaleXY/headroom/releases/download/v#{version}/Headroom-#{version}.dmg"
  name "Headroom"
  desc "Menu bar pace meter for Claude and Codex plan allowances"
  homepage "https://github.com/ScaleXY/headroom"

  conflicts_with cask: "headroom"
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Headroom.app"
  binary "#{appdir}/Headroom.app/Contents/MacOS/headroom"
  manpage "#{appdir}/Headroom.app/Contents/Resources/headroom.1"

  uninstall quit: "com.scalexy.headroom"

  zap trash: [
    "~/Library/Application Support/Headroom",
    "~/Library/Preferences/com.headroom.app.plist",
    "~/Library/Preferences/com.scalexy.headroom.plist",
  ]
end
