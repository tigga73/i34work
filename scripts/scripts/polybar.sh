#! /bin/bash

if pgrep -x polybar > /dev/null; then
  echo "finishing polybar"
  killall -q polybar

  while pgrep -x polybar > /dev/null; do
    sleep 0.1
  done
fi

polybar --config=~/.config/polybar/config.ini main &

