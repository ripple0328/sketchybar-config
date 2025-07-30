# SketchyBar Configuration Migration Guide

This document outlines the changes made during the refactoring of the SketchyBar configuration.

## Summary of Changes

### 1. **Directory Restructure**

**Before:**
```
sketchybar/
├── sketchybarrc
├── items/
│   ├── apple.sh
│   ├── app_info.sh
│   ├── workspaces.sh
│   ├── system_monitor.sh
│   ├── system_status.sh
│   ├── aerospace_mode.sh
│   ├── github.sh
│   └── spacers.sh
├── plugins/
│   ├── aerospace.sh
│   ├── battery.sh
│   ├── cpu_simple.sh
│   ├── memory.sh
│   ├── temperature.sh
│   ├── github.sh
│   ├── volume.sh
│   ├── clock.sh
│   ├── calendar.sh
│   ├── front_app.sh
│   ├── aerospace_mode.sh
│   ├── icon_map.sh
│   ├── workspace_click.sh
│   ├── front_app_click.sh
│   └── volume_click.sh
├── themes/
└── icons.sh
```

**After:**
```
sketchybar/
├── sketchybarrc              # Simplified main config
├── README.md                 # Documentation
├── MIGRATION.md             # This guide
├── config/                   # Core configuration
│   ├── globals.sh
│   ├── bar.sh
│   ├── defaults.sh
│   └── events.sh
├── segments/                 # Visual grouping
│   ├── left/
│   │   ├── apple_workspace.sh
│   │   └── app_info.sh
│   ├── center/
│   │   └── aerospace_mode.sh
│   └── right/
│       ├── system_monitor.sh
│       └── system_status.sh
├── items/                    # Item definitions
│   ├── app/
│   │   ├── apple.sh
│   │   └── app_info.sh
│   ├── workspace/
│   │   ├── workspaces.sh
│   │   └── aerospace_mode.sh
│   └── system/
│       ├── system_monitor.sh
│       ├── system_status.sh
│       └── github.sh
├── plugins/                  # Dynamic content scripts
│   ├── system/
│   │   ├── battery.sh
│   │   ├── cpu_simple.sh
│   │   ├── memory.sh
│   │   ├── temperature.sh
│   │   ├── github.sh
│   │   ├── volume.sh
│   │   ├── clock.sh
│   │   └── calendar.sh
│   ├── workspace/
│   │   ├── aerospace.sh
│   │   └── aerospace_mode.sh
│   └── utils/
│       ├── front_app.sh
│       ├── icon_map.sh
│       ├── workspace_click.sh
│       ├── front_app_click.sh
│       └── volume_click.sh
├── themes/
└── icons.sh
```

### 2. **File Content Changes**

#### Main Configuration (`sketchybarrc`)
- Simplified to only contain high-level organization
- Removed detailed item definitions and bracket configurations
- Now only loads core config, items, and segments

#### New Core Configuration Files
- `config/globals.sh` - Global variables and paths
- `config/bar.sh` - Bar appearance settings  
- `config/defaults.sh` - Default item settings
- `config/events.sh` - Event definitions

#### New Segment Files
- `segments/left/apple_workspace.sh` - Apple logo + workspace grouping
- `segments/left/app_info.sh` - App info grouping
- `segments/center/aerospace_mode.sh` - Aerospace mode grouping
- `segments/right/system_monitor.sh` - System monitor grouping
- `segments/right/system_status.sh` - System status grouping

### 3. **Path Updates**

All files have been updated to use the new directory structure:

- **Items**: Updated to load `config/globals.sh` instead of hardcoded paths
- **Plugins**: Updated to use new categorized plugin paths
- **References**: All `$PLUGIN_DIR/script.sh` references updated to `$PLUGIN_DIR/category/script.sh`

### 4. **Functional Changes**

#### Items vs Plugins Clarification
- **Items** (`items/` directory): Define what appears on the bar (sketchybar items)
- **Plugins** (`plugins/` directory): Executable scripts that update item content
- **Segments** (`segments/` directory): Group items visually (brackets)

#### Benefits of New Structure
1. **Clearer separation of concerns**: Items, plugins, and segments have distinct roles
2. **Better maintainability**: Related files are grouped together
3. **Easier debugging**: Issues can be isolated to specific categories
4. **Scalable organization**: Easy to add new components
5. **Self-documenting**: Directory structure explains functionality

### 5. **Migration Notes**

#### If you have custom modifications:
1. **Custom items**: Move to appropriate `items/` subdirectory
2. **Custom plugins**: Move to appropriate `plugins/` subdirectory  
3. **Custom segments**: Create in appropriate `segments/` subdirectory
4. **Update paths**: Change all references to use new directory structure

#### Configuration loading order:
1. Core configuration (globals, bar, defaults, events)
2. Items (define what appears)
3. Segments (group items visually) 
4. Finalization (update and initialize)

### 6. **Testing the Migration**

After migration, verify:
1. All items appear correctly on the bar
2. All plugins update content properly
3. All click handlers work
4. All segments group items correctly
5. Aerospace integration functions properly

### 7. **Rollback (if needed)**

To rollback to the original structure:
1. Restore the original `sketchybarrc` from backup
2. Move files back to the original flat structure
3. Update paths to remove categorization

The refactored configuration maintains 100% compatibility with the original functionality while providing better organization for future maintenance.