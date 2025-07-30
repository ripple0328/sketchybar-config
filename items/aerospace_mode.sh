#!/usr/bin/env sh

# Aerospace Mode Indicator
# This creates the mode indicator that shows when not in main mode

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
source "$HOME/.config/sketchybar/colors.sh"

# Aerospace Mode Indicator (separate when visible)
sketchybar --add item aerospace_mode left \
           --set aerospace_mode \
           drawing=off \
           background.color=$BACKGROUND_2 \
           background.corner_radius=10 \
           background.height=32 \
           script="$PLUGIN_DIR/aerospace_mode.sh" \
           click_script="aerospace mode main && sketchybar --trigger aerospace_mode_change AEROSPACE_MODE=main" \
           --subscribe aerospace_mode aerospace_mode_change 