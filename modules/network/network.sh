#!/bin/bash

network_center() {

echo
echo "======================================"
echo "        NETWORK CENTER"
echo "======================================"

HOSTNAME=$(hostname)

IP=$(hostname -I | awk '{print $1}')

GATEWAY=$(ip route | awk '/default/ {print $3}')

DNS=$(awk '/nameserver/ {print $2; exit}' /etc/resolv.conf)

PING=$(ping -c1 -W1 1.1.1.1 >/dev/null 2>&1 && echo "ONLINE" || echo "OFFLINE")

printf "%-14s %s\n" "Hostname:" "$HOSTNAME"
printf "%-14s %s\n" "IP Address:" "$IP"
printf "%-14s %s\n" "Gateway:" "$GATEWAY"
printf "%-14s %s\n" "DNS:" "$DNS"
printf "%-14s %s\n" "Internet:" "$PING"

echo "======================================"

}
