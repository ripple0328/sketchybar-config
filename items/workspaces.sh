#!/usr/bin/env sh

# Aerospace Workspace Items with App Icon Expansion
# This creates workspace indicators that expand to show app icons when active

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"

# Get all workspaces from aerospace and create items for them
WORKSPACE_ITEMS=()
WORKSPACE_LIST=($(aerospace list-workspaces --all))
WORKSPACE_COUNT=${#WORKSPACE_LIST[@]}

for i in "${!WORKSPACE_LIST[@]}"; do
    sid="${WORKSPACE_LIST[$i]}"
    WORKSPACE_ITEMS+=("space.$sid")
    
    # Add padding to the last workspace item
    if [ $((i + 1)) -eq $WORKSPACE_COUNT ]; then
        PADDING_RIGHT=10
    else
        PADDING_RIGHT=3
    fi
    
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        icon="$sid" \
        icon.font="$FONT:Regular:13.0" \
        icon.color=0xffffffff \
        icon.padding_left=10 \
        icon.padding_right=4 \
        label="" \
        label.color=0xff000000 \
        label.font="sketchybar-app-font:Regular:13.0" \
        label.drawing=off \
        label.padding_left=2 \
        label.padding_right=12 \
        label.y_offset=-1 \
        background.drawing=off \
        padding_right=$PADDING_RIGHT \
        update_freq=2 \
        click_script="$PLUGIN_DIR/workspace_click.sh $sid" \
        script="$PLUGIN_DIR/aerospace.sh $sid"
done

# Create a refresh trigger script for workspace updates
sketchybar --add item workspace_refresh left \
    --set workspace_refresh \
    script="$PLUGIN_DIR/refresh_workspaces.sh" \
    drawing=off \
    --subscribe workspace_refresh aerospace_workspace_change

# Export workspace items array for use in main config
echo "${WORKSPACE_ITEMS[@]}" > /tmp/sketchybar_workspace_items 