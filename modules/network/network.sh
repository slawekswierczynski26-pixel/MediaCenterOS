#!/bin/bash

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$MODULE_DIR/../../lib/ui.sh"

network_center() {

HOSTNAME=$(hostname)
IP=$(hostname -I | awk '{print $1}')
GATEWAY=$(ip route | awk '/default/ {print $3}')
DNS=$(awk '/nameserver/ {print $2; exit}' /etc/resolv.conf)

if ping -c1 -W1 1.1.1.1 >/dev/null 2>&1
then
    INTERNET="ONLINE"
else
    INTERNET="OFFLINE"
fi

ui_header
ui_title "SIEĆ"

ui_info "Hostname:" "$HOSTNAME"
ui_info "Adres IP:" "$IP"
ui_info "Brama:" "$GATEWAY"
ui_info "DNS:" "$DNS"

echo

if [ "$INTERNET" = "ONLINE" ]
then
    ui_ok "Połączenie z Internetem"
else
    ui_error "Brak połączenia z Internetem"
fi

ui_footer

}
