#!/bin/bash

entries="  Shutdown\n  Restart\n  Lock\n  Logout"

selected=$(echo -e "$entries" | wofi --dmenu --prompt "Power Menu" --width 260 --height 210 --cache-file /dev/null | awk '{print $2}')

case $selected in
  Shutdown)
    systemctl poweroff
    ;;
  Restart)
    systemctl reboot
    ;;
  Lock)
    swaylock -f -c 1e1e2e
    ;;
  Logout)
    swaymsg exit
    ;;
esac
