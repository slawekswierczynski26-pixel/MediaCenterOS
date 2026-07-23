#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

ui_clear() {
    clear
}

ui_header() {
    clear
    echo -e "${BLUE}==================================================${NC}"
    echo -e "${WHITE}               MediaCenterOS${NC}"
    echo -e "${BLUE}==================================================${NC}"
    echo
}

ui_title() {
    echo -e "${CYAN}$1${NC}"
    echo
}

ui_ok() {
    printf "${GREEN}✓${NC} %s\n" "$1"
}

ui_error() {
    printf "${RED}✗${NC} %s\n" "$1"
}

ui_info() {
    printf "%-16s %s\n" "$1" "$2"
}

ui_footer() {
    echo
    echo -e "${BLUE}==================================================${NC}"
}
