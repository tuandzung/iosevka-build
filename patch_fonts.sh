#!/bin/bash
set -Eeuo pipefail

WORKING_DIR=Iosevka/dist/Tepiosevka/TTF

for font in $(find $WORKING_DIR -type f -name "*.otf" -o -name "*.ttf" -o -name "*.woff" -o -name "*.eot" -o -name "*.ttc"); do
  fontforge -script nerd/font-patcher "$font" \
    --careful \
    --complete \
    --mono \
    --quiet \
    --no-progressbars \
    --makegroups -1 \
    --outputdir build/Tepiosevka

  fontforge -script nerd/font-patcher "$font" \
    --complete \
    --quiet \
    --no-progressbars \
    --outputdir build/TepiosevkaNF
done
