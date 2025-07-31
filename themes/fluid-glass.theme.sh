#!/usr/bin/env sh

# Fluid Glass Theme - Semantic Version
# Translucent frosted style inspired by macOS

# ==============================================================================
# SURFACE COLORS (backgrounds, cards, overlays)
# ==============================================================================

export SURFACE_BASE=0x80ffffff            # Main app background (frosted white)
export SURFACE_CONTAINER_PRIMARY=0x50ffffff    # Primary section backgrounds
export SURFACE_CONTAINER_SECONDARY=0x40ffffff  # Secondary section backgrounds
export SURFACE_OVERLAY=0x80f0f0f0         # Modal/popup backgrounds
export SURFACE_ELEVATED=0x99ffffff        # Raised card backgrounds

# ==============================================================================
# CONTENT COLORS (text, icons)
# ==============================================================================

export CONTENT_PRIMARY=0xff000000         # Main content text and icons
export CONTENT_SECONDARY=0xcc000000       # Supporting content
export CONTENT_TERTIARY=0x88000000        # Subtle/disabled content
export CONTENT_INVERSE=0xffffffff         # Content on colored backgrounds
export CONTENT_DISABLED=0x55000000        # Disabled content state

# ==============================================================================
# INTERACTIVE COLORS (buttons, links, controls)
# ==============================================================================

export INTERACTIVE_PRIMARY=0xff007AFF     # Primary brand actions and focus
export INTERACTIVE_SECONDARY=0xff5e5ce6   # Secondary actions
export INTERACTIVE_SELECTED=0xffffffff    # Selected/active items

export INTERACTIVE_HOVER=0x60ffffff       # Hover states
export INTERACTIVE_ACTIVE=0x80007AFF      # Pressed states
export INTERACTIVE_DISABLED=0x40999999    # Disabled states
export INTERACTIVE_FOCUS=0xff007AFF       # Focus outlines

# ==============================================================================
# STATE COLORS (alerts, status, semantic states)
# ==============================================================================

export STATE_SUCCESS=0xff34c759          # Success states
export STATE_WARNING=0xffff9f0a          # Warning states
export STATE_CAUTION=0xffffd60a          # Medium warning level
export STATE_ERROR=0xffff3b30            # Error states
export STATE_INFO=0xff007AFF             # Informational states

# ==============================================================================
# BORDER COLORS (dividers, outlines)
# ==============================================================================

export BORDER_PRIMARY=0x40ffffff          # Main borders
export BORDER_SECONDARY=0x20ffffff        # Subtle borders
export BORDER_FOCUS=0xff007AFF            # Focus outlines
export BORDER_DIVIDER=0x10ffffff          # Section separators

# ==============================================================================
# SPECIALIZED SYSTEM COLORS
# ==============================================================================

# Workspace states (specific semantic meanings)
export WORKSPACE_FOCUSED=0x99007AFF       # Currently focused workspace with focused app
export WORKSPACE_ACTIVE=$INTERACTIVE_HOVER # Active workspace (current but no focused app)
export WORKSPACE_UNFOCUSED=$CONTENT_TERTIARY # Inactive workspaces
export WORKSPACE_OCCUPIED=$STATE_SUCCESS   # Workspaces with windows
export WORKSPACE_EMPTY=$CONTENT_TERTIARY   # Empty workspaces

# Segment backgrounds (for visual grouping)
export SEGMENT_PRIMARY=$SURFACE_CONTAINER_PRIMARY    # Primary segments
export SEGMENT_SECONDARY=$SURFACE_CONTAINER_SECONDARY # Secondary segments

# ==============================================================================
# TYPOGRAPHY (fonts and text styling)
# ==============================================================================

export FONT_FAMILY_PRIMARY="MesloLGS Nerd Font"        # Main UI font
export FONT_FAMILY_ICONS="sketchybar-app-font"         # App icon font with ligatures
export FONT_FAMILY_SYSTEM="SF Pro"                     # System font for special cases

export FONT_SIZE_SMALL=11                              # Small text
export FONT_SIZE_MEDIUM=13                             # Regular text
export FONT_SIZE_LARGE=16                              # Large text/icons

# Main font variable used in sketchybar config
export FONT="$FONT_FAMILY_PRIMARY"                     # Default font for sketchybar

# ==============================================================================
# SKETCHYBAR MAPPINGS
# ==============================================================================

# Essential SketchyBar mappings
export TRANSPARENT=0x00000000            # Transparent background for main bar
export POPUP_BACKGROUND_COLOR=$SURFACE_OVERLAY
export POPUP_SHADOW_COLOR=0x60000000

