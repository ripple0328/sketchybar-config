#!/bin/sh

# Simple CPU usage monitoring
# Gets overall CPU percentage using top command

# Source colors
source "$HOME/.config/sketchybar/colors.sh"

# Get CPU usage from top (1 second sample)
CPU_USAGE=$(top -l 1 -s 0 | grep "CPU usage" | awk '{print $3}' | sed 's/%//')

if [ "$CPU_USAGE" = "" ]; then
  exit 0
fi

# Convert to integer for comparison
CPU_INT=$(echo "$CPU_USAGE" | cut -d. -f1)

# Set color based on usage
if [ "$CPU_INT" -ge 80 ]; then
  COLOR=$RED
elif [ "$CPU_INT" -ge 60 ]; then
  COLOR=$ORANGE
elif [ "$CPU_INT" -ge 40 ]; then
  COLOR=$YELLOW
else
  COLOR=$GREEN
fi

# Update the item
sketchybar --set "$NAME" label="${CPU_USAGE}%" label.color="$COLOR"