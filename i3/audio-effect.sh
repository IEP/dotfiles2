#!/usr/bin/sh
KEY="com.github.wwmm.pulseeffects bypass"
CURRENT=$(gsettings get $KEY)

if [ $CURRENT == "true" ]; then
    gsettings set $KEY false
    notify-send -i audio-volume-low -u low "Audio" "Effect: On"
else
    gsettings set $KEY true
    notify-send -i audio-volume-high -u low "Audio" "Effect: Off"
fi
