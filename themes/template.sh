#!/usr/bin/env sh

# Semantic Theme Template (Industry Standard)
# Based on Material Design, Adobe Spectrum, Atlassian, and Salesforce standards
# Names describe PURPOSE, not appearance

#===============================================================================
# SURFACE COLORS (backgrounds, cards, overlays)
#===============================================================================

export BACKGROUND_PRIMARY=0xff000000      # Main app background
export BACKGROUND_SECONDARY=0xff111111    # Card/section backgrounds  
export BACKGROUND_TERTIARY=0xff222222     # Subtle section backgrounds
export SURFACE_OVERLAY=0xff333333         # Modal/popup backgrounds
export SURFACE_ELEVATED=0xff444444        # Raised card backgrounds

#===============================================================================
# CONTENT COLORS (text, icons)
#===============================================================================

export TEXT_PRIMARY=0xffffffff            # Main content text
export TEXT_SECONDARY=0xffcccccc          # Supporting text
export TEXT_TERTIARY=0xff888888           # Subtle/disabled text
export TEXT_INVERSE=0xff000000            # Text on colored backgrounds

export ICON_PRIMARY=0xffffffff            # Main icons
export ICON_SECONDARY=0xffcccccc          # Supporting icons
export ICON_TERTIARY=0xff888888           # Subtle icons

#===============================================================================
# INTERACTIVE COLORS (buttons, links, controls)
#===============================================================================

export ACCENT_PRIMARY=0xff007AFF          # Primary brand actions
export ACCENT_SECONDARY=0xff5856d6        # Secondary actions

export INTERACTIVE_HOVER=0x60ffffff       # Hover states
export INTERACTIVE_ACTIVE=0x80ffffff      # Pressed states
export INTERACTIVE_DISABLED=0x40888888    # Disabled states
export INTERACTIVE_FOCUS=0xff007AFF       # Focus outlines

#===============================================================================
# FEEDBACK COLORS (alerts, status, semantic states)
#===============================================================================

export FEEDBACK_SUCCESS=0xff34c759        # Success states
export FEEDBACK_WARNING=0xffff9f0a        # Warning states
export FEEDBACK_ERROR=0xffff3b30          # Error states
export FEEDBACK_INFO=0xff007AFF           # Informational states

#===============================================================================
# BORDER COLORS (dividers, outlines)
#===============================================================================

export BORDER_PRIMARY=0xff555555          # Main borders
export BORDER_SECONDARY=0xff333333        # Subtle borders
export BORDER_FOCUS=0xff007AFF            # Focus outlines
export BORDER_DIVIDER=0xff222222          # Section separators

#===============================================================================
# SPECIALIZED SYSTEM COLORS
#===============================================================================

# System status colors (for monitoring)
export STATUS_SUCCESS=$FEEDBACK_SUCCESS    # System healthy
export STATUS_WARNING=$FEEDBACK_WARNING    # System attention needed
export STATUS_ERROR=$FEEDBACK_ERROR        # System critical
export STATUS_NEUTRAL=$TEXT_SECONDARY      # System neutral

# Workspace states
export WORKSPACE_ACTIVE=$ACCENT_PRIMARY    # Currently focused workspace
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

#===============================================================================
# SKETCHYBAR MAPPINGS
#===============================================================================

export BAR_COLOR=$BACKGROUND_PRIMARY
export ICON_COLOR=$ICON_PRIMARY
export LABEL_COLOR=$TEXT_PRIMARY

export BACKGROUND_1=$BACKGROUND_SECONDARY
export BACKGROUND_2=$BACKGROUND_TERTIARY
export BACKGROUND_3=$SURFACE_ELEVATED

export POPUP_BACKGROUND_COLOR=$SURFACE_OVERLAY

export POPUP_SHADOW_COLOR=0x60000000

export HOVER_COLOR=$INTERACTIVE_HOVER
export ACTIVE_GLOW=$INTERACTIVE_ACTIVE
export GLASS_LIGHT=0x40ffffff
export GLASS_DARK=0x40000000

export ACCENT_COLOR=$ACCENT_PRIMARY
export SUCCESS_COLOR=$FEEDBACK_SUCCESS
export WARNING_COLOR=$FEEDBACK_WARNING
export ERROR_COLOR=$FEEDBACK_ERROR

export BATTERY_LOW=$STATUS_ERROR
export BATTERY_CHARGING=$STATUS_SUCCESS
export CPU_HIGH=$STATUS_WARNING
export MEMORY_HIGH=$STATUS_WARNING
export TEMP_HIGH=$STATUS_ERROR

export GRADIENT_START=$BACKGROUND_SECONDARY
export GRADIENT_END=$BACKGROUND_TERTIARY
export SHADOW_COLOR=0x60000000

export ICON_HIGHLIGHT=$ACCENT_PRIMARY
export LABEL_HIGHLIGHT=$ACCENT_PRIMARY

# Basic colors (required for compatibility)
export BLACK=0xff000000
export WHITE=0xffffffff
export TRANSPARENT=0x00000000
export RED=$FEEDBACK_ERROR
export GREEN=$FEEDBACK_SUCCESS
export BLUE=$ACCENT_PRIMARY
export YELLOW=$FEEDBACK_WARNING
export ORANGE=$FEEDBACK_WARNING
export MAGENTA=$ACCENT_SECONDARY
export GREY=$TEXT_SECONDARY