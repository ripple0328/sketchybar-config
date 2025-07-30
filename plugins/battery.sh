#!/bin/sh

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"
BATTERY_INFO="$(pmset -g batt)"

# Check if this is a desktop (AC only) or laptop (has battery)
if [ "$PERCENTAGE" = "" ]; then
  # No battery detected - this is likely a desktop Mac
  if [[ "$CHARGING" != "" ]]; then
    # AC Power detected
    ICON="󰚥"  # AC power icon
    LABEL="AC"
  else
    # Fallback for unknown power state
    ICON="󰚥"
    LABEL="PWR"
  fi
else
  # Battery detected - this is a laptop/portable device
  case "${PERCENTAGE}" in
    9[0-9]|100) ICON="󰁹"  # Full battery
    ;;
    [6-8][0-9]) ICON="󰂀"  # High battery  
    ;;
    [3-5][0-9]) ICON="󰁾"  # Medium battery
    ;;
    [1-2][0-9]) ICON="󰁻"  # Low battery
    ;;
    *) ICON="󰂎"          # Very low/critical battery
  esac
  
  # Override with charging icon if plugged in
  if [[ "$CHARGING" != "" ]]; then
    ICON="󰂄"  # Charging icon
  fi
  
  LABEL="${PERCENTAGE}%"
fi

# Update the item with appropriate icon and label
sketchybar --set "$NAME" icon="$ICON" label="$LABEL"