#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "DIR = $DIR"
echo

for FILE in \
"$DIR/modules/system/system.sh" \
"$DIR/modules/network/network.sh" \
"$DIR/modules/media/media.sh" \
"$DIR/modules/storage/storage.sh" \
"$DIR/modules/audio/audio.sh"
do
    echo "Ładowanie: $FILE"

    if [ -f "$FILE" ]; then
        source "$FILE"
        echo "OK"
    else
        echo "BRAK PLIKU!"
    fi
done

echo
echo "Test funkcji:"
type system_center
type network_center
type media_center
type storage_center
type audio_center

echo
echo "==============================================="
echo "             MediaCenterOS"
echo "==============================================="

system_center
network_center
media_center
storage_center
audio_center
