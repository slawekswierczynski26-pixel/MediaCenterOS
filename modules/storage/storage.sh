#!/bin/bash

storage_center() {

echo
echo "======================================"
echo "         STORAGE CENTER"
echo "======================================"

echo
echo "[Mounted filesystems]"
findmnt -rno TARGET,SOURCE,FSTYPE,SIZE,USED,AVAIL

echo
echo "[Disk usage]"
df -h \
| grep '^/dev/' \
| awk '{printf "%-18s %6s used:%6s free:%6s mounted:%s\n",$1,$2,$3,$4,$6}'

echo
echo "[Block devices]"
lsblk -o NAME,SIZE,FSTYPE,MOUNTPOINT

}
