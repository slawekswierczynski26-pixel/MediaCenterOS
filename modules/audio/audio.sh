#!/bin/bash

audio_center() {

echo
echo "======================================"
echo "         AUDIO CENTER"
echo "======================================"

if command -v pactl >/dev/null 2>&1; then

DEFAULT=$(pactl get-default-sink 2>/dev/null)

if [ -z "$DEFAULT" ]; then
    DEFAULT="Brak"
fi

echo "Domyślne wyjście:"
echo "$DEFAULT"
echo

echo "Urządzenia audio:"
pactl list short sinks

else

echo "PipeWire/PulseAudio : BRAK"

fi

echo
echo "======================================"

}
