#!/bin/bash
set -Eeuo pipefail

WORKING_DIR=Iosevka/dist/Tepiosevka/TTF

mkdir -p TepiosevkaNerd
for font in `find $WORKING_DIR -type f -name "*.otf" -o -name "*.ttf" -o -name "*.woff" -o -name "*.eot" -o -name "*.ttc"`; do
  fontforge -script nerd/font-patcher $font \
    --careful \
    --complete \
    --mono \
    --quiet \
    --no-progressbars \
    --outputdir build/TepiosevkaNerdMono

  fontforge -script nerd/font-patcher $font \
    --careful \
    --complete \
    --quiet \
    --no-progressbars \
    --outputdir build/TepiosevkaNerd
done

mv $WORKING_DIR/Tepiosevka build/
