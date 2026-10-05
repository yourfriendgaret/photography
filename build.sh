#!/bin/sh
# Lists every photo in MEDIA into photos.js, so photos added to the folder
# appear on the site without editing index.html. Netlify runs this on every publish.
set -e
cd "$(dirname "$0")"

{
  echo "// Made by build.sh from the files in MEDIA. Don't edit by hand."
  echo "window.PHOTOS = ["
  find MEDIA -maxdepth 1 -type f ! -name '.*' \
    \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' -o -iname '*.avif' -o -iname '*.gif' \) \
    | sed -e 's|^MEDIA/||' -e 's/\\/\\\\/g' -e 's/"/\\"/g' -e 's/.*/  "&",/'
  echo "];"
} > photos.js

echo "photos.js lists $(grep -c '^  "' photos.js) photos"
