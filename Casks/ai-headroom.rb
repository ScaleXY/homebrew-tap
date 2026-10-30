# Homebrew cask for Headroom, published to ScaleXY/homebrew-tap by .github/workflows/release.yml.
# The workflow fills in version and sha256 for each tagged release; the rest is maintained here.
# Not "headroom": homebrew/cask has an unrelated app by that name, also installed as Headroom.app.
cask "ai-headroom" do
  version "0.4.0"
  sha256 "8f88972acc537259edfbfbfbe32179dd10d1cc7ddf579fa74b941c348eab4132"

  url "https://github.com/ScaleXY/headroom/releases/download/v#{version}/Headroom-#{version}.dmg"
  name "Headroom"
  desc "Menu bar pace meter for Claude and Codex plan allowances"
  homepage "https://github.com/ScaleXY/headroom"

  # Headroom updates itself in place (Sparkle); brew upgrade --greedy still works.
  auto_updates true
  conflicts_with cask: "headroom"
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Headroom.app"
  binary "#{appdir}/Headroom.app/Contents/MacOS/headroom"
  manpage "#{appdir}/Headroom.app/Contents/Resources/headroom.1"

  uninstall quit:      "com.scalexy.headroom",
            launchctl: "com.scalexy.headroom.fan"

  zap trash: [
    "~/Library/Application Support/Headroom",
    "~/Library/Preferences/com.headroom.app.plist",
    "~/Library/Preferences/com.scalexy.headroom.plist",
  ]
end
