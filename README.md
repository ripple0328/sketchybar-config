[![SketchyBar CI](https://github.com/ripple0328/sketchybar-config/actions/workflows/ci.yml/badge.svg)](https://github.com/ripple0328/sketchybar-config/actions/workflows/ci.yml)

# SketchyBar Configuration Structure

This directory contains a well-organized SketchyBar configuration designed for maintainability and clarity.

## Organizational Principles

### 1. **Items vs Plugins - Clear Distinction**

**Items** (`items/` directory):
- Define **what** appears on the bar (sketchybar items)
- Configure appearance, position, and static properties
- Set up click handlers and subscriptions
- Should contain `sketchybar --add item` and `sketchybar --set` commands

**Plugins** (`plugins/` directory):
- Define **how** content is generated/updated (executable scripts)
- Handle dynamic content updates and data processing
- Receive events and update item properties
- Should contain logic that outputs content via `sketchybar --set $NAME`

### 2. **Segments - Logical Grouping**

**Segments** (`segments/` directory):
- Group related items into visual segments (brackets)
- Define the visual grouping and layout of items
- Handle bracket creation and styling
- Keep segment definitions separate from item definitions

### 3. **File Structure**

```
sketchybar/
├── sketchybarrc              # Main config - high-level only
├── README.md                 # This documentation
├── config/                   # Core configuration
│   ├── globals.sh           # Global variables and paths
│   ├── bar.sh               # Bar appearance settings
│   ├── defaults.sh          # Default item settings
│   └── events.sh            # Event definitions
├── segments/                 # Visual grouping (brackets)
│   ├── left/                # Left side segments
│   ├── center/              # Center segments
│   └── right/               # Right side segments
├── items/                   # Item definitions
│   ├── system/              # System-related items
│   ├── workspace/           # Workspace-related items
│   └── app/                 # Application-related items
├── plugins/                 # Dynamic content scripts
│   ├── system/              # System monitoring scripts
│   ├── workspace/           # Workspace management scripts
│   └── utils/               # Utility scripts
├── themes/                  # Theme definitions
└── icons.sh                # Icon definitions
```

### 4. **Naming Conventions**

- **Items**: Use descriptive names indicating what they display
  - `items/system/battery.sh` - Battery status item
  - `items/workspace/spaces.sh` - Workspace items
  
- **Plugins**: Use descriptive names indicating what they do
  - `plugins/system/battery_update.sh` - Updates battery display
  - `plugins/workspace/aerospace_update.sh` - Updates workspace state

- **Segments**: Use location-based names
  - `segments/left/apple_workspace.sh` - Left segment with Apple logo and workspaces
  - `segments/right/system_status.sh` - Right segment with system status

### 5. **Dependencies and Loading Order**

1. **Core Config**: Load global variables, themes, icons first
2. **Items**: Define all bar items and their basic properties
3. **Segments**: Group items into visual segments (brackets)
4. **Finalization**: Update and initialize the bar

### 6. **Best Practices**

- Keep the main `sketchybarrc` minimal and high-level
- Use descriptive comments in all files
- Group related functionality together
- Avoid hardcoding paths - use variables from `config/globals.sh`
- Test each component independently when possible
- Use consistent styling and formatting across files

### 7. **Modification Guide**

**Adding a new item:**
1. Create item definition in appropriate `items/` subdirectory
2. Create plugin script in appropriate `plugins/` subdirectory  
3. Add item to relevant segment file
4. Update main config to load the new files

**Adding a new segment:**
1. Create segment file in appropriate `segments/` subdirectory
2. Define bracket and styling in the segment file
3. Reference segment in main config

**Modifying themes:**
1. Edit theme files in `themes/` directory
2. Changes will automatically apply to all items using theme variables

## Current Implementation

This refactored configuration maintains all existing functionality while providing:
- Clear separation of concerns
- Better maintainability  
- Easier debugging and modification
- Self-documenting structure
- Scalable organization for future additions