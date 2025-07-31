#!/usr/bin/env bash

# SketchyBar Theme Manager
# Easily switch between different color themes

THEME_DIR="$HOME/.config/sketchybar/themes"
CONFIG_DIR="$HOME/.config/sketchybar"
CURRENT_THEME_FILE="$THEME_DIR/.current-theme"

# Dynamically find available themes
THEMES=()
for theme_file in "$THEME_DIR"/*.theme.sh; do
    if [ -f "$theme_file" ]; then
        theme_name=$(basename "$theme_file" .theme.sh)
        THEMES+=("$theme_name")
    fi
done

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Function to display usage
show_usage() {
    echo -e "${BLUE}SketchyBar Theme Manager${NC}"
    echo ""
    echo -e "${YELLOW}Usage:${NC}"
    echo "  $0 [theme_name]     - Apply a specific theme"
    echo "  $0 list            - Show available themes"
    echo "  $0 current         - Show current theme"
    echo "  $0 preview [theme] - Preview theme colors"
    echo "  $0 random          - Apply a random theme"
    echo ""
    echo -e "${YELLOW}Available themes:${NC}"
    for theme in "${THEMES[@]}"; do
        echo "  • $theme"
    done
}

# Function to get current theme
get_current_theme() {
    if [ -f "$CURRENT_THEME_FILE" ]; then
        cat "$CURRENT_THEME_FILE"
    else
        echo "catppuccin"
    fi
}

# Function to set current theme
set_current_theme() {
    echo "$1" > "$CURRENT_THEME_FILE"
}

# Function to apply theme
apply_theme() {
    local theme_name="$1"
    local theme_file="$THEME_DIR/$theme_name.theme.sh"
    
    if [ ! -f "$theme_file" ]; then
        echo -e "${RED}Error: Theme '$theme_name' not found!${NC}"
        echo -e "${YELLOW}Available themes:${NC} ${THEMES[*]}"
    echo -e "${BLUE}📖 See themes/README.md for how to create new themes${NC}"
        exit 1
    fi
    
    echo -e "${BLUE}Applying theme: ${PURPLE}$theme_name${NC}"
    
    # Update current theme (no need to copy files anymore!)
    set_current_theme "$theme_name"
    
    # Restart sketchybar
    echo -e "${YELLOW}Restarting SketchyBar...${NC}"
    sketchybar --exit 2>/dev/null
    sleep 0.5
    sketchybar &
    
    echo -e "${GREEN}✓ Theme '$theme_name' applied successfully!${NC}"
    echo -e "${BLUE}ℹ  Theme is loaded directly from: ${theme_file}${NC}"
}

# Function to preview theme colors
preview_theme() {
    local theme_name="$1"
    local theme_file="$THEME_DIR/$theme_name.theme.sh"
    
    if [ ! -f "$theme_file" ]; then
        echo -e "${RED}Error: Theme '$theme_name' not found!${NC}"
        exit 1
    fi
    
    echo -e "${BLUE}Preview of theme: ${PURPLE}$theme_name${NC}"
    echo ""
    
    # Source the theme to get colors
    source "$theme_file"
    
    # Convert hex to RGB for preview (simplified)
    echo -e "🎨 Accent Color:     ${ACCENT_COLOR}"
    echo -e "✅ Success Color:    ${SUCCESS_COLOR}"
    echo -e "⚠️  Warning Color:    ${WARNING_COLOR}"
    echo -e "❌ Error Color:      ${ERROR_COLOR}"
    echo -e "🏢 Background 1:     ${BACKGROUND_1}"
    echo -e "🏢 Background 2:     ${BACKGROUND_2}"
    echo ""
}

# Function to list themes with current indicator
list_themes() {
    local current=$(get_current_theme)
    echo -e "${BLUE}Available Themes:${NC}"
    echo ""
    
    for theme in "${THEMES[@]}"; do
        if [ "$theme" = "$current" ]; then
            echo -e "  ${GREEN}➤ $theme${NC} ${YELLOW}(current)${NC}"
        else
            echo -e "    $theme"
        fi
    done
    echo ""
}

# Function to apply random theme
apply_random_theme() {
    local current=$(get_current_theme)
    local random_theme
    
    # Get a random theme that's not the current one
    while true; do
        random_theme=${THEMES[$RANDOM % ${#THEMES[@]}]}
        if [ "$random_theme" != "$current" ]; then
            break
        fi
    done
    
    echo -e "${PURPLE}🎲 Randomly selected: $random_theme${NC}"
    apply_theme "$random_theme"
}

# Main script logic
case "$1" in
    "list")
        list_themes
        ;;
    "current")
        current=$(get_current_theme)
        echo -e "${GREEN}Current theme: ${PURPLE}$current${NC}"
        ;;
    "preview")
        if [ -z "$2" ]; then
            echo -e "${RED}Error: Please specify a theme to preview${NC}"
            show_usage
            exit 1
        fi
        preview_theme "$2"
        ;;
    "random")
        apply_random_theme
        ;;
    "")
        show_usage
        ;;
    *)
        # Check if it's a valid theme name
        theme_found=false
        for theme in "${THEMES[@]}"; do
            if [[ "$theme" == "$1" ]]; then
                theme_found=true
                break
            fi
        done
        
        if $theme_found; then
            apply_theme "$1"
        else
            echo -e "${RED}Error: Unknown theme '$1'${NC}"
            show_usage
            exit 1
        fi
        ;;
esac