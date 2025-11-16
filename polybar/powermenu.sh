#!/bin/bash

chosen=$(printf "Cerrar sesión\nReiniciar\nSuspender\nApagar" | rofi -dmenu -no-input \
    -p "" \
    -theme-str 'entry { enabled: false; }' \
    -theme-str 'inputbar { enabled: false; }' \
)

case "$chosen" in
    "Cerrar sesión") i3-msg exit ;;
    "Reiniciar") systemctl reboot ;;
    "Suspender") systemctl suspend ;;
    "Apagar") systemctl poweroff ;;
esac
