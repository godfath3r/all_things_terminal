#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do echo "Waiting..."; done

# Launch primary monitor first. (to attach systray)
m=$(xrandr --query | grep " connected" | grep primary | cut -d" " -f1)
MONITOR=$m polybar --reload main &

# Then launch on rest monitors
for m in $(xrandr --query | grep " connected" | grep -v primary | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
done

#polybar main &

echo "Bar launched..."
