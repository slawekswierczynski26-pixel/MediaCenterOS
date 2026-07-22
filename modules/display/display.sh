#!/bin/bash

display_status() {
    clear

    echo "======================================"
    echo "         DISPLAY MANAGER"
    echo "======================================"

    echo
    echo "DISPLAY : ${DISPLAY:-:0}"

    if pgrep -f kodi.bin >/dev/null; then
        echo "KODI    : RUNNING"
    else
        echo "KODI    : STOPPED"
    fi

    echo
    loginctl list-sessions
}

display_start_kodi() {
    DISPLAY=:0 nohup kodi --standalone >/dev/null 2>&1 &
}

display_stop_kodi() {
    pkill -f kodi.bin
}

display_restart_kodi() {
    display_stop_kodi
    sleep 2
    display_start_kodi
}
