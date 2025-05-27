#!/bin/bash

# Define the menu options
options="Power Off\nReboot\nSuspend\nHibernate\nLogout\nLock"

# Show the menu using rofi
chosen=$(echo -e "$options" | tr '[:upper:]' '[:lower:]' | rofi -dmenu -p "")

# Execute the selected action
case "$chosen" in
    "Power Off")
        systemctl poweroff
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Suspend")
        systemctl suspend
        ;;
    "Hibernate")
        systemctl hibernate
        ;;
    "Logout")
        pkill -KILL -u $USER
        ;;
    "Lock")
        i3lock || betterlockscreen -l || slock
        ;;
    *)
        echo "No valid option selected."
        ;;
esac

