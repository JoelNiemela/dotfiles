#!/bin/bash
BRIGHTNESS_VALUE=`brightnessctl | grep -o "(.*" | tr -d "()"`

echo "%{F$POLYBAR_FG_ALT} %{F$POLYBAR_FG}$BRIGHTNESS_VALUE"
