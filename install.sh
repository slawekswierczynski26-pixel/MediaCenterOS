#!/bin/bash

clear

echo "======================================"
echo "      MediaCenterOS Installer"
echo "======================================"
echo

if [ -f install/install_display.sh ]; then
    bash install/install_display.sh
fi

echo
echo "======================================"
echo "Installation completed."
echo "======================================"
