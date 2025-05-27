#!/bin/bash

# Define the menu options
options="Power Off\nReboot\nSuspend\nHibernate\nLogout\nLock"

# Show the menu using rofi
chosen=$(echo -e "$options" | tr '[:upper:]' '[:lower:]' | rofi -dmenu -p "")

# Execute the selected action
case "$chosen" in
    "power off")
        systemctl poweroff
        ;;
    "reboot")
        systemctl reboot
        ;;
    "suspend")
        systemctl suspend
        ;;
    "hibernate")
        systemctl hibernate
        ;;
    "logout")
        pkill -KILL -u $USER
        ;;
    "lock")
        i3lock || betterlockscreen -l || slock
        ;;
    *)
        echo "No valid option selected."
        ;;
esac

