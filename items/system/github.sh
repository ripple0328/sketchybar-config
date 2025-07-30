#!/usr/bin/env sh

# Load global configuration
source "$HOME/.config/sketchybar/config/globals.sh"

POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

sketchybar --add       item            github.bell right                  \
           --set       github.bell     update_freq=180                    \
                                       icon=$BELL                         \
                                       icon.color=$ACCENT_COLOR           \
                                       label=$LOADING                     \
                                       label.highlight_color=$ACCENT_COLOR \
                                       background.drawing=off             \
                                       padding_right=8                    \
                                       popup.align=right                  \
                                       script="$PLUGIN_DIR/system/github.sh"     \
                                       click_script="$POPUP_CLICK_SCRIPT" \
           --subscribe github.bell     mouse.entered                      \
                                       mouse.exited                       \
                                       mouse.exited.global                \
                                                                          \
           --add       item            github.template popup.github.bell  \
           --set       github.template drawing=off                        \
                                       background.corner_radius=12        \
                                       background.padding_left=7          \
                                       background.padding_right=7         \
                                       icon.background.height=2           \
                                       icon.background.y_offset=-12


