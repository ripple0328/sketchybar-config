#!/usr/bin/env sh

# Aerospace Workspace Items
# This creates workspace indicators for aerospace window manager

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"

# Get all workspaces from aerospace and create items for them
WORKSPACE_ITEMS=()
for sid in $(aerospace list-workspaces --all); do
    WORKSPACE_ITEMS+=("space.$sid")
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        label="$sid" \
        label.color=0xffffffff \
        background.drawing=off \
        click_script="$PLUGIN_DIR/workspace_click.sh $sid" \
        script="$PLUGIN_DIR/aerospace.sh $sid"
done

# Export workspace items array for use in main config
echo "${WORKSPACE_ITEMS[@]}" > /tmp/sketchybar_workspace_items 