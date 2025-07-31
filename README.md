[![SketchyBar CI](https://github.com/ripple0328/sketchybar-config/actions/workflows/ci.yml/badge.svg)](https://github.com/ripple0328/sketchybar-config/actions/workflows/ci.yml)

# SketchyBar Configuration

A SketchyBar configuration with Aerospace integration, theming support, and modular organization.

## ✨ Features

- **Aerospace Integration** - Workspace indicators with app icons
- **Multiple Themes** - Catppuccin, Dracula, Tokyo Night, Nord, and more
- **System Monitoring** - CPU, memory, temperature, battery status
- **GitHub Notifications** - Notification counts when authenticated
- **Modular Structure** - Organized separation of items, plugins, and segments
- **Customizable** - Configuration files for modifications

![Screenshot](images/Screenshot%202025-07-30%20at%2022.31.28.png)

![Screenshot](images/Screenshot%202025-07-30%20at%2022.33.00.png)

![Screenshot](images/Screenshot%202025-07-30%20at%2022.37.37.png)

![Screenshot](images/Screenshot%202025-07-30%20at%2022.40.27.png)

![Screenshot](images/Screenshot%202025-07-30%20at%2022.49.07.png)

## 📋 Requirements

- [SketchyBar](https://github.com/FelixKratz/SketchyBar) - macOS status bar replacement
- [Aerospace](https://github.com/i3/i3) - Tiling window manager (for workspace features)
- [GitHub CLI](https://cli.github.com/) (optional, for GitHub notifications)
- [Nerd Font](https://www.nerdfonts.com/) - For icons (MesloLGS recommended)

## 🚀 Quick Start

1. **Install dependencies:**

   ```bash
   brew install sketchybar gh aerospace
   ```

2. **Clone or copy this configuration:**

   ```bash
   cp -r /path/to/this/config ~/.config/sketchybar
   ```

3. **Start SketchyBar:**

   ```bash
   brew services start sketchybar
   ```

4. **Restart the configuration:**

   ```bash
   sketchybar --reload
   ```

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

```text
sketchybar/
├── sketchybarrc                      # Main config - orchestrates loading
├── README.md                         # This documentation
├── MIGRATION.md                      # Migration guide from old structure
├── PRINCIPLES.md                     # Design principles and philosophy
├── icons.sh                          # Icon definitions
├── config/                           # Core configuration
│   ├── globals.sh                   # Global variables and paths
│   ├── bar.sh                       # Bar appearance settings
│   ├── defaults.sh                  # Default item settings
│   └── events.sh                    # Event definitions
├── segments/                         # Visual grouping (brackets)
│   ├── left/
│   │   ├── apple_workspace.sh       # Apple logo + workspace segment
│   │   └── app_info.sh              # App information segment
│   ├── center/
│   │   └── aerospace_mode.sh        # Aerospace mode indicator
│   └── right/
│       ├── system_monitor.sh        # CPU, memory, temperature
│       └── system_status.sh         # Battery, volume, clock
├── items/                            # Item definitions
│   ├── app/
│   │   ├── apple.sh                 # Apple menu with popup
│   │   └── app_info.sh              # Current app display
│   ├── system/
│   │   ├── github.sh                # GitHub notifications
│   │   ├── system_monitor.sh        # System monitoring items
│   │   └── system_status.sh         # System status items
│   └── workspace/
│       ├── aerospace_mode.sh        # Aerospace mode indicator
│       └── workspaces.sh            # Dynamic workspace items
├── plugins/                          # Dynamic content scripts
│   ├── system/
│   │   ├── battery.sh               # Battery status updates
│   │   ├── calendar.sh              # Calendar display
│   │   ├── clock.sh                 # Time display
│   │   ├── cpu_simple.sh            # CPU usage monitoring
│   │   ├── github.sh                # GitHub API integration
│   │   ├── memory.sh                # Memory usage monitoring
│   │   ├── temperature.sh           # Temperature monitoring
│   │   ├── volume.sh                # Volume level display
│   │   └── volume_click.sh          # Volume click handler
│   ├── workspace/
│   │   ├── aerospace.sh             # Workspace state management
│   │   └── aerospace_mode.sh        # Mode change handling
│   └── utils/
│       ├── front_app.sh             # Current app detection
│       ├── front_app_click.sh       # App click handler
│       ├── icon_map.sh              # App icon mapping
│       └── workspace_click.sh       # Workspace click handler
├── themes/                           # Theme definitions
│   ├── catppuccin.sh               # Catppuccin theme
│   ├── dracula.sh                  # Dracula theme
│   ├── tokyo-night.sh              # Tokyo Night theme
│   ├── nord.sh                     # Nord theme
│   ├── gruvbox.sh                  # Gruvbox theme
│   ├── load-theme.sh               # Theme loader
│   ├── theme-manager.sh            # Theme management
│   └── validate-themes.sh          # Theme validation
└── images/                           # Screenshots and documentation images
```

### 4. **Naming Conventions**

- **Items**: Use descriptive names indicating what they display
  - `items/system/battery.sh` - Battery status item definition
  - `items/workspace/workspaces.sh` - Workspace items definition

- **Plugins**: Use descriptive names indicating what they do
  - `plugins/system/battery.sh` - Updates battery display content
  - `plugins/workspace/aerospace.sh` - Updates workspace state

- **Segments**: Use location-based names describing the grouping
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

## 🎨 Themes

Multiple themes available with semantic color system. See [themes/README.md](themes/README.md) for complete documentation and usage.

## 🔧 Customization

For detailed customization and development guidelines, see [CONTRIBUTING.md](CONTRIBUTING.md).

## 🐛 Troubleshooting

### Common Issues

**SketchyBar not starting:**

```bash
# Check if SketchyBar is running
pgrep sketchybar

# Kill and restart
killall sketchybar
brew services restart sketchybar
```

**Missing icons:**

- Install a Nerd Font (MesloLGS recommended)
- Update font references in theme files

**Aerospace integration not working:**

- Ensure Aerospace is installed and configured
- Check that workspace scripts have execute permissions

**Theme not loading:**

- Verify theme file exists in `themes/` directory
- Check `themes/current-theme.txt` content
- Ensure theme file has proper variable exports

### Debug Mode

```bash
# Enable verbose logging
sketchybar --reload --verbose

# Check individual component
~/.config/sketchybar/plugins/system/battery.sh
```

## 📚 Additional Documentation

- **[CONTRIBUTING.md](CONTRIBUTING.md)** - Developer guidelines and architecture principles
- **[themes/README.md](themes/README.md)** - Comprehensive theming system documentation

## Current Implementation

This configuration provides:

- Clear separation of concerns between items, plugins, and segments
- Modular architecture for maintenance and extension
- Theming system with multiple built-in themes
- Aerospace window manager integration
- System monitoring with visual indicators
- GitHub integration for development workflows
- Organized code structure
- CI/CD pipeline for code quality
- Customization and modification support
