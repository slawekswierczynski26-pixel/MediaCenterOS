#!/bin/bash

echo "Installing Display Manager..."

sudo cp systemd/kodi-hdmi.service /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable kodi-hdmi.service

echo
echo "Display Manager installed."
