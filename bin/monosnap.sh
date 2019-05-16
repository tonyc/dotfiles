#!/usr/bin/env bash

set -e

BASE_DIR="${HOME}/Pictures/uploads"
FILENAME=$(uuidgen).png

FULL_PATH="${BASE_DIR}/${FILENAME}"

gnome-screenshot --area --file=$FULL_PATH

/usr/bin/aws s3 cp ${FULL_PATH} s3://pics.manero.org --acl public-read

URL="http://pics.manero.org/${FILENAME}"
echo $URL | xclip -in -selection clipboard
notify-send "Screenshot uploaded" $URL
