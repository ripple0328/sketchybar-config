#!/usr/bin/env bash

# SketchyBar plugin for Aerospace workspace management
# This script handles workspace highlighting and ensures proper visual feedback

# The workspace ID is passed as the first argument
WORKSPACE_ID="$1"

# Check if this workspace is currently focused
if [ "$WORKSPACE_ID" = "$FOCUSED_WORKSPACE" ]; then
    # Highlight the active workspace
    sketchybar --set $NAME \
        background.drawing=on \
        background.color=0x66ffffff \
        label.color=0xff000000 \
        icon.color=0xff000000
else
    # Dim the inactive workspace
    sketchybar --set $NAME \
        background.drawing=off \
        label.color=0xffffffff \
        icon.color=0xffffffff
fi

# Optional: Add workspace-specific icons or colors
case "$WORKSPACE_ID" in
    "1"|"2"|"3")
        # Numbered workspaces
        sketchybar --set $NAME icon=""
        ;;
    "A")
        # AI workspace
        sketchybar --set $NAME icon="󰚩"
        ;;
    "B")
        # Browser workspace
        sketchybar --set $NAME icon="󰖟"
        ;;
    "C")
        # Calendar workspace
        sketchybar --set $NAME icon="󰃭"
        ;;
    "E")
        # Editor workspace
        sketchybar --set $NAME icon="󰷈"
        ;;
    "M")
        # Messages workspace
        sketchybar --set $NAME icon="󰍩"
        ;;
    "T")
        # Terminal workspace
        sketchybar --set $NAME icon="󰆍"
        ;;
    "Z")
        # Meeting workspace
        sketchybar --set $NAME icon="󰍫"
        ;;
    *)
        # Default icon for other workspaces
        sketchybar --set $NAME icon="󰧨"
        ;;
esac
