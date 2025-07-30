#!/usr/bin/env bash

# Test script for Aerospace Mode Indicator
# This script helps test different aerospace modes to see the indicator in action

echo "Testing Aerospace Mode Indicator..."
echo "=================================="

echo ""
echo "1. Testing SERVICE mode..."
aerospace mode service
sketchybar --trigger aerospace_mode_change AEROSPACE_MODE=service
echo "   → Should show orange 'SERVICE' indicator on right side"
sleep 3

echo ""
echo "2. Testing RESIZE mode..."
aerospace mode resize  
sketchybar --trigger aerospace_mode_change AEROSPACE_MODE=resize
echo "   → Should show orange 'RESIZE' indicator on right side"
sleep 3

echo ""
echo "3. Testing MOVE mode..."
aerospace mode move
sketchybar --trigger aerospace_mode_change AEROSPACE_MODE=move
echo "   → Should show orange 'MOVE' indicator on right side"
sleep 3

echo ""
echo "4. Returning to MAIN mode..."
aerospace mode main
sketchybar --trigger aerospace_mode_change AEROSPACE_MODE=main
echo "   → Indicator should disappear"

echo ""
echo "Test complete! The aerospace mode indicator should now be hidden."
echo "You can manually test modes with: aerospace mode [service|resize|move|main]"