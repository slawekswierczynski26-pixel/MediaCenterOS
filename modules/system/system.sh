#!/bin/bash

system_center() {

echo
echo "======================================"
echo "         SYSTEM CENTER"
echo "======================================"

HOST=$(hostname)

OS=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')

KERNEL=$(uname -r)

UPTIME=$(uptime -p)

CPU=$(cut -d' ' -f1 /proc/loadavg)

RAM_USED=$(free -h | awk 'NR==2 {print $3}')
RAM_TOTAL=$(free -h | awk 'NR==2 {print $2}')

DISK=$(df -h / | awk 'NR==2 {print $3 " / " $2}')

DATE=$(date "+%d.%m.%Y %H:%M")

printf "%-14s %s\n" "Hostname:" "$HOST"
printf "%-14s %s\n" "OS:" "$OS"
printf "%-14s %s\n" "Kernel:" "$KERNEL"
printf "%-14s %s\n" "Uptime:" "$UPTIME"

echo

printf "%-14s %s\n" "CPU Load:" "$CPU"
printf "%-14s %s\n" "RAM:" "$RAM_USED / $RAM_TOTAL"
printf "%-14s %s\n" "Root Disk:" "$DISK"

echo

printf "%-14s %s\n" "Date:" "$DATE"

echo "======================================"

}
