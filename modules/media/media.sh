#!/bin/bash

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$MODULE_DIR/../../lib/ui.sh"

media_center() {

ui_header
ui_title "MULTIMEDIA"

if pgrep -x kodi >/dev/null
then
    ui_ok "Kodi działa"
else
    ui_error "Kodi zatrzymany"
fi

if systemctl is-active --quiet xrdp
then
    ui_ok "Usługa xRDP działa"
else
    ui_error "Usługa xRDP zatrzymana"
fi

if pgrep -x pipewire >/dev/null
then
    ui_ok "PipeWire działa"
else
    ui_error "PipeWire zatrzymany"
fi

ui_footer

}
