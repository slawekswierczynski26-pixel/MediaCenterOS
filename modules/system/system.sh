#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$DIR/../../lib/ui.sh"

system_center() {

HOST=$(hostname)
OS=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
KERNEL=$(uname -r)
UPTIME=$(uptime -p)
CPU=$(cut -d' ' -f1 /proc/loadavg)
RAM_USED=$(free -h | awk 'NR==2 {print $3}')
RAM_TOTAL=$(free -h | awk 'NR==2 {print $2}')
DISK=$(df -h / | awk 'NR==2 {print $3 " / " $2}')
DATE=$(date "+%d.%m.%Y %H:%M")

ui_title "SYSTEM CENTER"

ui_item "Hostname:" "$HOST"
ui_item "OS:" "$OS"
ui_item "Kernel:" "$KERNEL"
ui_item "Uptime:" "$UPTIME"

echo

ui_item "CPU Load:" "$CPU"
ui_item "RAM:" "$RAM_USED / $RAM_TOTAL"
ui_item "Root Disk:" "$DISK"

echo

ui_item "Date:" "$DATE"

ui_footer

}
