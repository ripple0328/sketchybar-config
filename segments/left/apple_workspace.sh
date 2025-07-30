#!/usr/bin/env bash

# Left Segment 1: Apple Logo + Workspaces
# This segment groups the Apple logo with workspace items

# Load global configuration
source "$HOME/.config/sketchybar/config/globals.sh"

# Read workspace items from temp file (created by workspace items)
WORKSPACE_ITEMS=($(cat /tmp/sketchybar_workspace_items 2>/dev/null || echo ""))

# Create bracket with Apple logo and workspaces
if [ ${#WORKSPACE_ITEMS[@]} -gt 0 ]; then
    sketchybar --add bracket apple_spaces apple.logo "${WORKSPACE_ITEMS[@]}" \
               --set apple_spaces background.color=$BACKGROUND_1 \
                                 background.corner_radius=16 \
                                 background.height=32 \
                                 padding_right=0
else
    # Fallback if no workspaces found
    sketchybar --add bracket apple_spaces apple.logo \
               --set apple_spaces background.color=$BACKGROUND_1 \
                                 background.corner_radius=16 \
                                 background.height=32 \
                                 padding_right=0
fi