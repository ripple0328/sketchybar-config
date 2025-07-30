#!/usr/bin/env sh

# Apple Logo and Popup Menu
# This creates the Apple logo with a popup menu

FONT="MesloLGS Nerd Font"
APPLE="󰀵"
GREEN="0xffa6da95"
PREFERENCES="󰍉"
ACTIVITY="󱣳"
LOCK="󰍁"

POPUP_OFF="sketchybar --set apple.logo popup.drawing=off"
POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

# Apple logo main item
sketchybar --add item apple.logo left \
           --set apple.logo \
           icon=$APPLE \
           icon.font="$FONT:Black:16.0" \
           icon.color=$GREEN \
           background.drawing=off \
           label.drawing=off \
           padding_left=10 \
           click_script="$POPUP_CLICK_SCRIPT"

# Apple popup menu items  
sketchybar --add item apple.prefs popup.apple.logo \
           --set apple.prefs \
           icon=$PREFERENCES \
           label="Preferences" \
           click_script="open -a 'System Preferences'; $POPUP_OFF"

sketchybar --add item apple.activity popup.apple.logo \
           --set apple.activity \
           icon=$ACTIVITY \
           label="Activity" \
           click_script="open -a 'Activity Monitor'; $POPUP_OFF"

sketchybar --add item apple.lock popup.apple.logo \
           --set apple.lock \
           icon=$LOCK \
           label="Lock Screen" \
           click_script="pmset displaysleepnow; $POPUP_OFF" 