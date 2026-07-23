#!/bin/bash

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$MODULE_DIR/../../lib/ui.sh"

storage_center() {

ROOT_USAGE=$(df -h / | awk 'NR==2 {print $3 " / " $2 " (" $5 ")"}')

DATA_USAGE=$(df -h | awk '$6=="/DATA" {print $3 " / " $2 " (" $5 ")"}')

DISKS=$(lsblk -d -o NAME,SIZE,MODEL | tail -n +2)

ui_header
ui_title "DYSKI"

ui_info "System:" "$ROOT_USAGE"

if [ -n "$DATA_USAGE" ]
then
    ui_info "Dane:" "$DATA_USAGE"
fi

echo

echo "Wykryte dyski:"
echo

echo "$DISKS"

ui_footer

}
