#!/usr/bin/env sh

# SketchyBar Theme Loader
# This small helper loads the current theme directly
# Source this file to get all color variables

THEME_DIR="$HOME/.config/sketchybar/themes"
CURRENT_THEME_FILE="$HOME/.config/sketchybar/themes/.current-theme"

# Get current theme name
if [ -f "$CURRENT_THEME_FILE" ]; then
    CURRENT_THEME=$(cat "$CURRENT_THEME_FILE")
else
    CURRENT_THEME="catppuccin"
    echo "$CURRENT_THEME" > "$CURRENT_THEME_FILE"
fi

# Load the current theme directly
THEME_FILE="$THEME_DIR/$CURRENT_THEME.theme.sh"

if [ -f "$THEME_FILE" ]; then
    source "$THEME_FILE"
else
    # Fallback to catppuccin if theme file doesn't exist
    echo "Warning: Theme '$CURRENT_THEME' not found, falling back to catppuccin" >&2
    source "$THEME_DIR/catppuccin.theme.sh"
    echo "catppuccin" > "$CURRENT_THEME_FILE"
fi

# Export theme name for scripts that might need it
export SKETCHYBAR_THEME="$CURRENT_THEME"