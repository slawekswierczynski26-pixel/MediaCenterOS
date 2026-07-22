#!/bin/bash

ui_line() {
    printf '=%.0s' {1..38}
    echo
}

ui_title() {
    echo
    ui_line
    printf "        %s\n" "$1"
    ui_line
}

ui_footer() {
    ui_line
}

ui_item() {
    printf "%-14s %s\n" "$1" "$2"
}
