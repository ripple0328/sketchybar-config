#!/usr/bin/env bash

# SketchyBar plugin for Aerospace workspace management
# This script handles workspace highlighting and app icon expansion

# The workspace ID is passed as the first argument
WORKSPACE_ID="$1"

# Get current focused workspace
CURRENT_WORKSPACE=$(aerospace list-workspaces --focused)

# Function to get app list for a workspace
get_workspace_app_list() {
    local workspace_id="$1"
    aerospace list-windows --workspace "$workspace_id" 2>/dev/null | awk '{print $3}' | sort | uniq
}

# Function to get app icons for a workspace
get_workspace_apps() {
    local workspace_id="$1"
    local icon_strip=""
    
    # Get list of apps in the workspace
    local apps=$(get_workspace_app_list "$workspace_id")
    
    if [ -n "$apps" ]; then
        while IFS= read -r app; do
            if [ -n "$app" ]; then
                # Get icon for the app using icon_map.sh
                local app_icon=$("$HOME/.config/sketchybar/plugins/icon_map.sh" "$app")
                if [ -n "$app_icon" ]; then
                    icon_strip+="$app_icon "
                fi
            fi
        done <<< "$apps"
    fi
    
    echo "$icon_strip"
}

# Check if this workspace is currently focused
if [ "$WORKSPACE_ID" = "$CURRENT_WORKSPACE" ]; then
    # Get app icons for active workspace
    APP_ICONS=$(get_workspace_apps "$WORKSPACE_ID")
    
    # Highlight the active workspace and show app icons
    sketchybar --set $NAME \
        background.drawing=on \
        background.color=0x66ffffff \
        label.color=0xff000000 \
        icon.color=0xff000000 \
        label="$APP_ICONS" \
        label.drawing=on \
        label.padding_left=8 \
        label.padding_right=8 \
        label.font="sketchybar-app-font:Regular:16.0"
else
    # Dim the inactive workspace and hide app icons
    sketchybar --set $NAME \
        background.drawing=off \
        label.color=0xffffffff \
        icon.color=0xffffffff \
        label="" \
        label.drawing=off
fi

# Set workspace-specific icons
case "$WORKSPACE_ID" in
    "1"|"2"|"3")
        # Numbered workspaces
        sketchybar --set $NAME icon="$WORKSPACE_ID"
        ;;
    "A")
        # AI workspace
        sketchybar --set $NAME icon="A"
        ;;
    "B")
        # Browser workspace
        sketchybar --set $NAME icon="B"
        ;;
    "C")
        # Calendar workspace
        sketchybar --set $NAME icon="C"
        ;;
    "E")
        # Editor workspace
        sketchybar --set $NAME icon="E"
        ;;
    "M")
        # Messages workspace
        sketchybar --set $NAME icon="M"
        ;;
    "T")
        # Terminal workspace
        sketchybar --set $NAME icon="T"
        ;;
    "Z")
        # Meeting workspace
        sketchybar --set $NAME icon="Z"
        ;;
    *)
        # Use workspace ID as icon for other workspaces
        sketchybar --set $NAME icon="$WORKSPACE_ID"
        ;;
esac
