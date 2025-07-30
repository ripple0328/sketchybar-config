#!/usr/bin/env sh

# App Info Items
# This creates the chevron separator and front app display

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"

# Chevron separator
sketchybar --add item chevron left \
           --set chevron \
           icon=󰅂 \
           label.drawing=off \
           background.drawing=off

# Front app display
sketchybar --add item front_app left \
           --set front_app \
           icon.drawing=off \
           background.drawing=off \
           script="$PLUGIN_DIR/front_app.sh" \
           click_script="$PLUGIN_DIR/front_app_click.sh" \
           --subscribe front_app front_app_switched 