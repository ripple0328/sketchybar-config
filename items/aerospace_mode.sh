#!/usr/bin/env sh

# Aerospace Mode Indicator
# This creates the mode indicator that shows when not in main mode (positioned in center)

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
source "$HOME/.config/sketchybar/colors.sh"

# Aerospace Mode Indicator (centered, separate segment when visible)
sketchybar --add item aerospace_mode center \
           --set aerospace_mode \
           drawing=off \
           background.drawing=off \
                      background.color=$RED \
           background.corner_radius=10 \
           background.height=32 \
           icon.color=$BLACK \
           label.color=$BLACK \
           script="$PLUGIN_DIR/aerospace_mode.sh" \
           click_script="aerospace mode main && ~/.config/sketchybar/plugins/aerospace_mode.sh main" \
           --subscribe aerospace_mode aerospace_mode_change 