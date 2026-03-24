#!/usr/bin/env bash
# =============================================================================
# download_fonts.sh
# Kitchen Companion — Font Asset Downloader
# Run once after cloning: bash scripts/download_fonts.sh
# All fonts are OFL-licensed (free, open-source) from Google Fonts.
# =============================================================================

set -e

DEST="entry/src/main/resources/rawfile/fonts"
mkdir -p "$DEST"

echo "⬇  Downloading fonts into $DEST ..."

# Playfair Display Bold (variable font — includes Bold/700)
curl -fsSL -o "$DEST/PlayfairDisplay-Bold.ttf" \
  "https://raw.githubusercontent.com/google/fonts/main/ofl/playfairdisplay/PlayfairDisplay%5Bwght%5D.ttf"
echo "✓  PlayfairDisplay-Bold.ttf"

# DM Serif Display Regular
curl -fsSL -o "$DEST/DMSerifDisplay-Regular.ttf" \
  "https://raw.githubusercontent.com/google/fonts/main/ofl/dmserifdisplay/DMSerifDisplay-Regular.ttf"
echo "✓  DMSerifDisplay-Regular.ttf"

# DM Sans (variable font — covers Regular/400 and Medium/500)
curl -fsSL -o "$DEST/DMSans-Regular.ttf" \
  "https://raw.githubusercontent.com/google/fonts/main/ofl/dmsans/DMSans%5Bopsz%2Cwght%5D.ttf"
echo "✓  DMSans-Regular.ttf"

# DM Sans Medium (same variable font file — ArkUI uses fontWeight to select 500)
curl -fsSL -o "$DEST/DMSans-Medium.ttf" \
  "https://raw.githubusercontent.com/google/fonts/main/ofl/dmsans/DMSans%5Bopsz%2Cwght%5D.ttf"
echo "✓  DMSans-Medium.ttf"

echo ""
echo "All 4 fonts downloaded successfully."
echo "Font path: $(pwd)/$DEST"

# Verify file sizes
for f in PlayfairDisplay-Bold DMSerifDisplay-Regular DMSans-Regular DMSans-Medium; do
  size=$(wc -c < "$DEST/${f}.ttf")
  echo "  ${f}.ttf — ${size} bytes"
done
