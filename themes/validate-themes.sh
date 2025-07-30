#!/usr/bin/env bash

# Theme Validation Script
# Checks that all themes have the required color definitions

# Detect the correct theme directory dynamically
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if we're running from repo root or themes directory
if [[ "$SCRIPT_DIR" == */themes ]]; then
    # Running from themes directory (or called from themes dir)
    THEME_DIR="$SCRIPT_DIR"
else
    # Running from repo root (CI scenario)
    THEME_DIR="$SCRIPT_DIR/themes"
fi
THEMES=("catppuccin" "tokyo-night" "gruvbox" "nord" "dracula")

# Required core colors that all themes must have
REQUIRED_COLORS=(
    # Core Semantic Colors (required for theme system)
    "BACKGROUND_PRIMARY"
    "BACKGROUND_SECONDARY"
    "BACKGROUND_TERTIARY"
    "SURFACE_OVERLAY"
    "SURFACE_ELEVATED"
    "TEXT_PRIMARY"
    "TEXT_SECONDARY"
    "TEXT_TERTIARY"
    "TEXT_INVERSE"
    "ICON_PRIMARY"
    "ICON_SECONDARY"
    "ICON_TERTIARY"
    "ACCENT_PRIMARY"
    "ACCENT_SECONDARY"
    "INTERACTIVE_HOVER"
    "INTERACTIVE_ACTIVE"
    "INTERACTIVE_DISABLED"
    "INTERACTIVE_FOCUS"
    "FEEDBACK_SUCCESS"
    "FEEDBACK_WARNING"
    "FEEDBACK_ERROR"
    "FEEDBACK_INFO"
    "BORDER_PRIMARY"
    "BORDER_SECONDARY"
    "BORDER_FOCUS"
    "BORDER_DIVIDER"
    "STATUS_SUCCESS"
    "STATUS_WARNING"
    "STATUS_ERROR"
    "STATUS_NEUTRAL"
    "WORKSPACE_ACTIVE"
    "WORKSPACE_INACTIVE"
    "WORKSPACE_HOVER"
    "WORKSPACE_OCCUPIED"
    "WORKSPACE_EMPTY"
    
    # Typography
    "FONT"
    "FONT_FAMILY_PRIMARY"
    "FONT_FAMILY_ICONS"
    "FONT_FAMILY_SYSTEM"
    "FONT_SIZE_SMALL"
    "FONT_SIZE_MEDIUM"
    "FONT_SIZE_LARGE"
    
    # Essential SketchyBar Variables (actually used)
    "TRANSPARENT"
    "ICON_COLOR"
    "LABEL_COLOR"
    "BACKGROUND_1"
    "BACKGROUND_2"
    "POPUP_BACKGROUND_COLOR"
    "POPUP_SHADOW_COLOR"
    "ACCENT_COLOR"
    "SUCCESS_COLOR"
    "WARNING_COLOR"
    "ERROR_COLOR"
    "YELLOW"
)

# Terminal colors for output (avoid conflicts with theme colors)
TERM_RED='\033[0;31m'
TERM_GREEN='\033[0;32m'
TERM_YELLOW='\033[1;33m'
TERM_BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${TERM_BLUE}🎨 Theme Validation Report${NC}"
echo "=================================================="

TOTAL_ERRORS=0

for theme in "${THEMES[@]}"; do
    echo ""
    echo -e "${TERM_BLUE}Checking theme: ${TERM_YELLOW}$theme${NC}"
    
    theme_file="$THEME_DIR/$theme.sh"
    
    if [ ! -f "$theme_file" ]; then
        echo -e "  ${TERM_RED}❌ Theme file not found: $theme_file${NC}"
        TOTAL_ERRORS=$((TOTAL_ERRORS + 1))
        continue
    fi
    
    # Source the theme to check for colors
    source "$theme_file"
    
    MISSING_COLORS=()
    
    for color in "${REQUIRED_COLORS[@]}"; do
        # Check if the color variable is defined and not empty
        if [ -z "${!color}" ]; then
            MISSING_COLORS+=("$color")
        fi
    done
    
    if [ ${#MISSING_COLORS[@]} -eq 0 ]; then
        echo -e "  ${TERM_GREEN}✅ All required colors defined${NC}"
    else
        echo -e "  ${TERM_RED}❌ Missing colors (${#MISSING_COLORS[@]}):${NC}"
        for missing in "${MISSING_COLORS[@]}"; do
            echo -e "     - $missing"
        done
        TOTAL_ERRORS=$((TOTAL_ERRORS + ${#MISSING_COLORS[@]}))
    fi
done

echo ""
echo "=================================================="
if [ $TOTAL_ERRORS -eq 0 ]; then
    echo -e "${TERM_GREEN}🎉 All themes are valid! No errors found.${NC}"
else
    echo -e "${TERM_RED}⚠️  Found $TOTAL_ERRORS validation errors.${NC}"
    echo -e "${TERM_YELLOW}💡 Use the template at themes/_template.sh to fix missing colors.${NC}"
fi

exit $TOTAL_ERRORS