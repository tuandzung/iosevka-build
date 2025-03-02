#!/bin/bash
set -Eeuo pipefail

WORKING_DIR=Iosevka/dist/Tepiosevka/TTF

mkdir -p TepiosevkaNerd
for font in `find $WORKING_DIR -type f -name "*.otf" -o -name "*.ttf" -o -name "*.woff" -o -name "*.eot" -o -name "*.ttc"`; do
  fontforge -script nerd/font-patcher \
    -out ./TepiosevkaNerd \
    -c -q -l -s --careful --makegroups -1 \
    $font > /dev/null
done
