#!/bin/bash

media_center() {

echo
echo "======================================"
echo "         MEDIA CENTER"
echo "======================================"

pgrep -x kodi >/dev/null \
    && echo "✓ Kodi     RUNNING" \
    || echo "✗ Kodi     STOPPED"

systemctl is-active --quiet xrdp \
    && echo "✓ xRDP     RUNNING" \
    || echo "✗ xRDP     STOPPED"

}
