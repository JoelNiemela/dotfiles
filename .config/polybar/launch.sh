#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Load Polybar color-scheme
source ~/.config/polybar/color-env.sh

export POLYBAR_USER_HOSTNAME="$(whoami)@$(hostname)"

# Launch Polybar, using default config location ~/.config/polybar/config
polybar polybar-bottom 2>&1 | tee -a /tmp/polybar.log & disown
polybar polybar-top 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
