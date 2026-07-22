#!/bin/bash

USER_NAME="${SUDO_USER:-$USER}"
USER_HOME=$(eval echo "~$USER_NAME")
XSESSION="$USER_HOME/.xsession"

echo "======================================"
echo "Installing Display Manager..."
echo "======================================"

if [ ! -f "$XSESSION" ]; then
cat > "$XSESSION" << 'EOF'
#!/bin/sh
exec dbus-launch --exit-with-session xfce4-session
EOF
fi

cp "$XSESSION" "$XSESSION.bak.$(date +%Y%m%d_%H%M%S)"

if ! grep -q "### MediaCenterOS ###" "$XSESSION"; then

TMP=$(mktemp)

cat > "$TMP" << 'EOF'
#!/bin/sh

### MediaCenterOS ###
if [ "$DISPLAY" = ":0" ]; then
(
    sleep 5
    /usr/bin/kodi >/dev/null 2>&1 &
)
fi

exec dbus-launch --exit-with-session xfce4-session
EOF

mv "$TMP" "$XSESSION"

chmod +x "$XSESSION"

echo "Kodi autostart installed."

else

echo "Kodi autostart already configured."

fi

echo
echo "Display Manager installed."
