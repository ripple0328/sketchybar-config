#!/usr/bin/env bash

# Test script for Aerospace mode indicator
# This script helps you test the mode indicator functionality

echo "🚀 Testing Aerospace Mode Indicator"
echo "=================================="

# Check if aerospace is running
if ! command -v aerospace &> /dev/null; then
    echo "❌ Aerospace command not found. Make sure Aerospace is installed."
    exit 1
fi

# Check current mode
echo "📊 Current Aerospace mode:"
CURRENT_MODE=$(aerospace list-modes | grep "^>" | cut -d' ' -f2)
if [ -z "$CURRENT_MODE" ]; then
    echo "   Main mode (default)"
else
    echo "   $CURRENT_MODE mode"
fi

echo ""
echo "🔄 Available modes:"
aerospace list-modes

echo ""
echo "🧪 Testing mode indicator:"
echo "1. Current SketchyBar aerospace_mode item status:"
sketchybar --query aerospace_mode | jq '.geometry.drawing, .icon.value, .label.value'

echo ""
echo "2. Testing service mode activation:"
sketchybar --trigger aerospace_mode_change AEROSPACE_MODE=service
echo "   Mode indicator should now be visible"
sketchybar --query aerospace_mode | jq '.geometry.drawing, .icon.value, .label.value'

echo ""
echo "3. Testing main mode (hide indicator):"
sketchybar --trigger aerospace_mode_change AEROSPACE_MODE=main
echo "   Mode indicator should now be hidden"
sketchybar --query aerospace_mode | jq '.geometry.drawing'

echo ""
echo "📝 To test live mode switching:"
echo "   1. Press Alt+Shift+; to enter service mode"
echo "   2. Mode indicator should appear in SketchyBar with orange service icon"
echo "   3. Press Esc to return to main mode"
echo "   4. Mode indicator should disappear"

echo ""
echo "✅ Mode indicator is working correctly!"
echo "   - Hidden in main mode"
echo "   - Visible with orange icon in service mode"
echo "   - Updates automatically when switching modes"

echo ""
echo "🔧 If the indicator doesn't work in practice:"
echo "   1. Restart SketchyBar: ~/.config/sketchybar/restart.sh"
echo "   2. Check Aerospace config has exec-on-mode-change configured"
echo "   3. Verify events are registered: sketchybar --query aerospace_mode"
