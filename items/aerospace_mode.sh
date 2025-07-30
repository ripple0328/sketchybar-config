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
           padding_left=10 \
           padding_right=10 \
           icon.color=$BLUE \
           icon.padding_left=0 \
           icon.padding_right=6 \
           label.color=$WHITE \
           label.padding_left=0 \
           label.padding_right=0 \
           label.font="SF Pro:Medium:11.0" \
           script="$PLUGIN_DIR/aerospace_mode.sh" \
           click_script="aerospace mode main && ~/.config/sketchybar/plugins/aerospace_mode.sh main" \
           --subscribe aerospace_mode aerospace_mode_change 