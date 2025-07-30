#!/usr/bin/env bash

# Test script for the improved Aerospace Mode Indicator
# Shows the new red background with black text for better readability

echo "Testing Improved Aerospace Mode Indicator"
echo "========================================"
echo ""

echo "✨ Improvements made:"
echo "  • Changed background from orange to red for better visibility"
echo "  • Changed text from white to black for better contrast on red"
echo "  • Added 10px spacer between mode indicator and system status"
echo ""

echo "🔴 Showing SERVICE mode (red background, black text)..."
~/.config/sketchybar/plugins/aerospace_mode.sh service
sleep 3

echo ""
echo "⚫ Hiding indicator (returning to main mode)..."
~/.config/sketchybar/plugins/aerospace_mode.sh main

echo ""
echo "✅ Test complete!"
echo ""
echo "To manually test:"
echo "  • Press Alt+Shift+; to enter service mode"
echo "  • Press Escape to return to main mode"
echo "  • Click the red indicator to return to main mode"