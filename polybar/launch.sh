#!/usr/bin/env sh

## Add this to your wm startup file.
autorandr horizontal
#sleep 1
nitrogen --restore &

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

PRIMARY=$(polybar --list-monitors | grep "primary" | cut -d":" -f1)
OTHERS=$(polybar --list-monitors | grep -v "primary" | cut -d":" -f1)

MONITOR=$PRIMARY polybar main -c ~/.config/polybar/config.ini &
sleep 1

for m in $OTHERS; do
    MONITOR=$m polybar main -c ~/.config/polybar/config.ini &
done

