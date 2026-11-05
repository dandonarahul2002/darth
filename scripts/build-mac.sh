#!/bin/bash
# Builds, signs (ad-hoc) and packages Darth for Apple Silicon Macs.
#   bash scripts/build-mac.sh               build, make Darth.dmg, install to /Applications and open
#   bash scripts/build-mac.sh --no-install  build and make Darth.dmg only (used by CI)
set -euo pipefail
cd "$(dirname "$0")/.."
APP="Darth"
ARCH="${ARCH:-arm64}"
INSTALL=1
[[ "${1:-}" == "--no-install" ]] && INSTALL=0

if ! command -v npm >/dev/null 2>&1; then
  echo "Node.js isn't installed. Run: brew install node   then run this script again."
  exit 1
fi
[[ -d node_modules/@electron/packager ]] || { echo "→ Installing build tools…"; npm install --no-audit --no-fund; }

echo "→ Packaging $APP ($ARCH)…"
npx electron-packager . "$APP" \
  --platform=darwin --arch="$ARCH" \
  --icon=build/icon.icns --app-bundle-id=com.rahuldandona.darth \
  --app-category-type=public.app-category.music \
  --extend-info=build/extra.plist --out=dist --overwrite \
  --ignore='^/(dist|build|scripts|docs|\.github)($|/)' --ignore='\.dmg$' \
  --ignore='^/(README|CONTRIBUTING|CHANGELOG|LICENSE)' --ignore='^/\.(editorconfig|gitignore)$'

BUNDLE="dist/$APP-darwin-$ARCH/$APP.app"

echo "→ Signing (ad-hoc)…"
xattr -cr "$BUNDLE"
codesign --force --deep --sign - "$BUNDLE"
codesign --verify --deep --strict "$BUNDLE" && echo "  signature OK"

DMG="dist/$APP.dmg"
echo "→ Building ${DMG}…"
STAGE="$(mktemp -d)"
cp -R "$BUNDLE" "$STAGE/"
ln -s /Applications "$STAGE/Applications"
hdiutil create -volname "$APP" -srcfolder "$STAGE" -ov -format UDZO "$DMG" >/dev/null
rm -rf "$STAGE"
echo "  $(pwd)/$DMG"

if [[ $INSTALL == 1 ]]; then
  osascript -e "quit app \"$APP\"" 2>/dev/null || true
  echo "→ Installing to /Applications…"
  rm -rf "/Applications/$APP.app"
  cp -R "$BUNDLE" /Applications/
  echo "Done. Opening $APP."
  open "/Applications/$APP.app"
fi
