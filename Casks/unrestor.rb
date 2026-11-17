# Homebrew cask for Unrestor. This is the source of truth: the Release workflow
# copies it to Casks/unrestor.rb in github.com/GAM3RG33K/homebrew-tap and sets
# `version` and `sha256` for each release. Edit everything else here.
#   brew install --cask GAM3RG33K/tap/unrestor
cask "unrestor" do
  version "0.1.3"
  sha256 "439b4dbe0d0e2855b6e1705ac95ca69f973e25518da9682dcfc53f7b1b552238"

  url "https://github.com/GAM3RG33K/unrestor/releases/download/v#{version}/Unrestor-#{version}.dmg"
  name "Unrestor"
  desc "Keep your MacBook awake with the lid closed while work runs"
  homepage "https://github.com/GAM3RG33K/unrestor"

  depends_on macos: :sonoma

  app "Unrestor.app"
  binary "#{appdir}/Unrestor.app/Contents/Helpers/unrestor"

  # The app is ad-hoc signed, not notarized (no paid Apple account). Clearing
  # the download quarantine mark lets it open without the Gatekeeper warning.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Unrestor.app"]
  end

  # Removes the root background service before the app goes away.
  uninstall_preflight do
    system_command "#{appdir}/Unrestor.app/Contents/Helpers/unrestor",
                   args:         ["uninstall"],
                   sudo:         true,
                   must_succeed: false
  end

  uninstall quit: "app.unrestor"

  zap trash: [
    "~/Library/Application Support/Unrestor",
    "~/Library/Preferences/app.unrestor.plist",
  ]

  caveats <<~EOS
    One more step: install the background service (asks for your password once):
      sudo unrestor install
    Then try:
      unrestor run -- sleep 30
  EOS
end
