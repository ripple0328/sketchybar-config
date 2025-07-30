#!/usr/bin/env bash

# SketchyBar plugin for Aerospace mode indicator
# Shows when Aerospace is in a mode other than "main"

# Get the current mode from the environment variable passed by Aerospace
# If not available, fall back to querying aerospace directly
CURRENT_MODE="$AEROSPACE_MODE"
if [ -z "$CURRENT_MODE" ]; then
    CURRENT_MODE=$(aerospace list-modes | grep "^>" | cut -d' ' -f2 2>/dev/null)
fi

# Debug logging (uncomment for troubleshooting)
# echo "DEBUG: AEROSPACE_MODE=$AEROSPACE_MODE, CURRENT_MODE=$CURRENT_MODE" >> /tmp/aerospace_mode.log

# If no mode is active or it's main mode, hide the indicator
if [ -z "$CURRENT_MODE" ] || [ "$CURRENT_MODE" = "main" ]; then
    sketchybar --set aerospace_mode \
        drawing=off \
        label="" \
        icon=""
else
    # Show the mode indicator with appropriate styling
    case "$CURRENT_MODE" in
        "service")
            ICON="󰒓"  # Service/settings icon
            COLOR="0xffff9500"
            LABEL="S"
            ;;
        *)
            ICON="󰒓"  # Default icon
            COLOR="0xff007acc"  # Blue
            LABEL=""
            ;;
    esac

    sketchybar --set aerospace_mode \
        drawing=on \
        icon="$ICON" \
        label="$LABEL" \
        icon.color="$COLOR" \
        label.color="$COLOR" \
        background.drawing=on \
        background.color=0x44ffffff \
        background.corner_radius=5 \
        background.height=25 \
        icon.padding_left=8 \
        icon.padding_right=4 \
        label.padding_left=4 \
        label.padding_right=8
fi
