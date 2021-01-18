#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
 
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch "mrvizious" bar on all monitors
if type "xrandr"; then
  for m in $(polybar --list-monitors | cut -d":" -f1); do
      MONITOR=$m polybar --reload mrvizious &
  done
else
  polybar --reload mrvizious &
fi

echo "Bar(s) launched..."
