#!/usr/bin/env sh

# Catppuccin Macchiato Theme - Semantic Version
# Industry-standard semantic naming with Catppuccin color values

#===============================================================================
# SURFACE COLORS (backgrounds, cards, overlays)
#===============================================================================

export BACKGROUND_PRIMARY=0xff24273a      # Main app background (Catppuccin base)
export BACKGROUND_SECONDARY=0x903c3e4f    # Card/section backgrounds (Catppuccin surface0)
export BACKGROUND_TERTIARY=0x90494d64     # Subtle section backgrounds (Catppuccin surface1)
export SURFACE_OVERLAY=0xff1e2030         # Modal/popup backgrounds (Catppuccin mantle)
export SURFACE_ELEVATED=0xff363a4f        # Raised card backgrounds (Catppuccin surface2)

#===============================================================================
# CONTENT COLORS (text, icons)
#===============================================================================

export TEXT_PRIMARY=0xffcad3f5            # Main content text (Catppuccin text)
export TEXT_SECONDARY=0xffbcc0cc          # Supporting text (Catppuccin subtext1)
export TEXT_TERTIARY=0xffa5adcb           # Subtle/disabled text (Catppuccin subtext0)
export TEXT_INVERSE=0xff181926            # Text on colored backgrounds (Catppuccin base)

export ICON_PRIMARY=0xffcad3f5            # Main icons (Catppuccin text)
export ICON_SECONDARY=0xffbcc0cc          # Supporting icons (Catppuccin subtext1)
export ICON_TERTIARY=0xffa5adcb           # Subtle icons (Catppuccin subtext0)

#===============================================================================
# INTERACTIVE COLORS (buttons, links, controls)
#===============================================================================

export ACCENT_PRIMARY=0xff8aadf4          # Primary brand actions (Catppuccin blue)
export ACCENT_SECONDARY=0xffc6a0f6        # Secondary actions (Catppuccin mauve)

export INTERACTIVE_HOVER=0x60cad3f5       # Hover states (Catppuccin text with transparency)
export INTERACTIVE_ACTIVE=0x808aadf4      # Pressed states (Catppuccin blue with transparency)
export INTERACTIVE_DISABLED=0x40939ab7    # Disabled states (Catppuccin overlay2)
export INTERACTIVE_FOCUS=0xff8aadf4       # Focus outlines (Catppuccin blue)

#===============================================================================
# FEEDBACK COLORS (alerts, status, semantic states)
#===============================================================================

export FEEDBACK_SUCCESS=0xffa6da95        # Success states (Catppuccin green)
export FEEDBACK_WARNING=0xffeed49f        # Warning states (Catppuccin yellow)
export FEEDBACK_ERROR=0xffed8796          # Error states (Catppuccin red)
export FEEDBACK_INFO=0xff8aadf4           # Informational states (Catppuccin blue)

#===============================================================================
# BORDER COLORS (dividers, outlines)
#===============================================================================

export BORDER_PRIMARY=0xff6e738d          # Main borders (Catppuccin overlay1)
export BORDER_SECONDARY=0xff5b6078        # Subtle borders (Catppuccin overlay0)
export BORDER_FOCUS=0xff8aadf4            # Focus outlines (Catppuccin blue)
export BORDER_DIVIDER=0xff494d64          # Section separators (Catppuccin surface1)

#===============================================================================
# SPECIALIZED SYSTEM COLORS
#===============================================================================

# System status colors (for monitoring)
export STATUS_SUCCESS=$FEEDBACK_SUCCESS    # System healthy
export STATUS_WARNING=$FEEDBACK_WARNING    # System attention needed
export STATUS_ERROR=$FEEDBACK_ERROR        # System critical
export STATUS_NEUTRAL=$TEXT_SECONDARY      # System neutral

# Workspace states
export WORKSPACE_ACTIVE=0x998aadf4         # Currently focused workspace (semi-transparent blue)
export WORKSPACE_INACTIVE=$TEXT_TERTIARY   # Inactive workspaces
export WORKSPACE_HOVER=$INTERACTIVE_HOVER  # Workspace hover state
export WORKSPACE_OCCUPIED=$FEEDBACK_SUCCESS # Workspaces with windows
export WORKSPACE_EMPTY=$TEXT_TERTIARY      # Empty workspaces

#===============================================================================
# TYPOGRAPHY (fonts and text styling)
#===============================================================================

export FONT_FAMILY_PRIMARY="MesloLGS Nerd Font"        # Main UI font
export FONT_FAMILY_ICONS="sketchybar-app-font"         # App icon font with ligatures
export FONT_FAMILY_SYSTEM="SF Pro"                     # System font for special cases

export FONT_SIZE_SMALL=11                              # Small text
export FONT_SIZE_MEDIUM=13                             # Regular text  
export FONT_SIZE_LARGE=16                              # Large text/icons

# Main font variable used in sketchybar config
export FONT="$FONT_FAMILY_PRIMARY"                     # Default font for sketchybar

#===============================================================================
#===============================================================================
# SKETCHYBAR SPECIFIC MAPPINGS (only keep variables actually used)
#===============================================================================

# Essential color mappings for SketchyBar
export TRANSPARENT=0x00000000              # Transparent background for main bar
export ICON_COLOR=$ICON_PRIMARY            # Default icon color
export LABEL_COLOR=$TEXT_PRIMARY           # Default label color

# Segment backgrounds (used in brackets)
export BACKGROUND_1=$BACKGROUND_SECONDARY  # Primary segments
export BACKGROUND_2=$BACKGROUND_TERTIARY   # Secondary segments

# Popup styling
export POPUP_BACKGROUND_COLOR=$SURFACE_OVERLAY
export POPUP_SHADOW_COLOR=0x60000000

# Legacy color aliases (still used by plugins)
export ACCENT_COLOR=$ACCENT_PRIMARY        # Used in sketchybarrc
export SUCCESS_COLOR=$FEEDBACK_SUCCESS     # Used by battery, cpu plugins
export WARNING_COLOR=$FEEDBACK_WARNING     # Used by cpu, memory plugins  
export ERROR_COLOR=$FEEDBACK_ERROR         # Used by battery, cpu plugins
export YELLOW=$FEEDBACK_WARNING            # Used by cpu plugin


