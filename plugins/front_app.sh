#!/bin/sh

# Front app with icon mapping
# Uses the same icon mapping system as workspace app icons

# Load theme colors and fonts
source "$HOME/.config/sketchybar/themes/load-theme.sh"

if [ "$SENDER" = "front_app_switched" ]; then
  # Get the app icon using the icon mapping
  APP_ICON=$("$HOME/.config/sketchybar/plugins/icon_map.sh" "$INFO")
  
  # Set both icon and label
  sketchybar --set "$NAME" \
    icon="$APP_ICON" \
    icon.font="sketchybar-app-font:Regular:16.0" \
    icon.drawing=on \
    label="$INFO"
fi
