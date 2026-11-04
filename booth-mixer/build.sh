#!/bin/bash
# Builds, signs and packages Booth Mixer on this Mac.
set -euo pipefail
cd "$(dirname "$0")"
APP="Booth Mixer"

if ! command -v npx >/dev/null 2>&1; then
  echo "Node.js isn't installed. Run: brew install node   then run this script again."
  exit 1
fi

echo "→ Packaging $APP (downloads Electron the first time, ~100 MB)…"
npx --yes @electron/packager@18.3.6 . "$APP" \
  --platform=darwin --arch=arm64 --electron-version=33.2.1 \
  --icon=icon.icns --app-bundle-id=com.rahuldandona.boothmixer \
  --app-category-type=public.app-category.music \
  --extend-info=extra.plist --out=dist --overwrite \
  --ignore='^/dist' --ignore='^/build\.sh' --ignore='\.plist$' --ignore='\.icns$' --ignore='\.dmg$'  --ignore="^/dmg-stage"

BUNDLE="dist/$APP-darwin-arm64/$APP.app"

echo "→ Signing (ad-hoc, local)…"
xattr -cr "$BUNDLE"
codesign --force --deep --sign - "$BUNDLE"
codesign --verify --deep --strict "$BUNDLE" && echo "  signature OK"

echo "→ Building Booth-Mixer.dmg…"
rm -rf dmg-stage && mkdir dmg-stage
cp -R "$BUNDLE" dmg-stage/
ln -s /Applications dmg-stage/Applications
hdiutil create -volname "$APP" -srcfolder dmg-stage -ov -format UDZO "Booth-Mixer.dmg" >/dev/null
rm -rf dmg-stage
echo "  $(pwd)/Booth-Mixer.dmg"

osascript -e 'quit app "Booth Mixer"' 2>/dev/null || true
echo "→ Installing to /Applications…"
rm -rf "/Applications/$APP.app"
cp -R "$BUNDLE" /Applications/
echo "Done. Opening $APP."
open "/Applications/$APP.app"
