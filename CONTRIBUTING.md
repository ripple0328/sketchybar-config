# Contributing to SketchyBar Configuration

This document provides comprehensive guidelines for contributors and developers working with this SketchyBar configuration.

## 📁 Project Structure

### File Organization

```text
sketchybar/
├── sketchybarrc                      # Main config - orchestrates loading
├── README.md                         # User documentation
├── CONTRIBUTING.md                   # This developer guide
├── MIGRATION.md                      # Migration guide from old structure
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
│   ├── catppuccin.theme.sh          # Catppuccin theme
│   ├── dracula.theme.sh             # Dracula theme
│   ├── tokyo-night.theme.sh         # Tokyo Night theme
│   ├── nord.theme.sh                # Nord theme
│   ├── gruvbox.theme.sh             # Gruvbox theme
│   ├── theme-manager.sh             # Theme management
│   └── validate-themes.sh           # Theme validation
└── images/                           # Screenshots and documentation images
```

### Component Distinction

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

**Segments** (`segments/` directory):
- Group related items into visual segments (brackets)
- Define the visual grouping and layout of items
- Handle bracket creation and styling
- Keep segment definitions separate from item definitions

### Dependencies and Loading Order

1. **Core Config**: Load global variables, themes, icons first
2. **Items**: Define all bar items and their basic properties
3. **Segments**: Group items into visual segments (brackets)
4. **Finalization**: Update and initialize the bar

## 🏗️ Architecture Principles

### Core Design Philosophy

*"The configuration should be as easy to understand as it is to modify. When someone opens a file, its purpose should be immediately clear from both its location and its content."*

### 1. **Separation of Concerns**

Each type of file has a specific, well-defined purpose:

- **Main Config (`sketchybarrc`)**: Entry point, orchestrates loading
- **Core Config (`config/`)**: Fundamental settings (bar, defaults, globals, events)
- **Items (`items/`)**: Define what appears on the bar and where
- **Plugins (`plugins/`)**: Provide dynamic content and handle updates
- **Segments (`segments/`)**: Group items visually (brackets)

### 2. **Clear Hierarchy**

```
Configuration Loading Order:
1. Global variables and theme loading
2. Bar appearance and default item settings  
3. Event definitions
4. Item definitions (what appears)
5. Segment groupings (visual organization)
6. Finalization and initialization
```

### 3. **Logical Categorization**

Files are grouped by functionality, not file type:

- **System**: System monitoring, status, hardware-related
- **Workspace**: Aerospace, workspaces, window management  
- **App**: Application-related items and functionality
- **Utils**: Shared utilities and helper scripts

### Naming Conventions

- **Items**: Use descriptive names indicating what they display
  - `items/system/battery.sh` - Battery status item definition
  - `items/workspace/workspaces.sh` - Workspace items definition
  
- **Plugins**: Use descriptive names indicating what they do
  - `plugins/system/battery.sh` - Updates battery display content
  - `plugins/workspace/aerospace.sh` - Updates workspace state

- **Segments**: Use location-based names describing the grouping
  - `segments/left/apple_workspace.sh` - Left segment with Apple logo and workspaces
  - `segments/right/system_status.sh` - Right segment with system status

## 🛠️ Development Guidelines

### Adding a New Item

1. **Create item definition** in appropriate `items/` subdirectory
2. **Create plugin script** in appropriate `plugins/` subdirectory
3. **Add to relevant segment** or create new segment if needed
4. **Load in main config** following the established order
5. **Use global variables** for all paths and theming

**Example structure:**
```bash
# 1. Item definition
items/system/weather.sh          # Defines the weather item

# 2. Plugin script  
plugins/system/weather.sh        # Updates weather content

# 3. Add to segment
segments/right/system_status.sh  # Include in right segment

# 4. Load in main config
sketchybarrc                     # Source the new files
```

### Adding a New Segment

1. Create segment file in appropriate `segments/` subdirectory
2. Define bracket and styling in the segment file
3. Reference segment in main config

### Creating New Themes

See [themes/README.md](themes/README.md) for theme creation guide.

### Modifying Existing Components

1. **Identify the component type**: Item definition vs plugin logic
2. **Make changes in the appropriate file**
3. **Test the specific component** in isolation if possible
4. **Verify integration** with related components

## 🔍 Debugging Guidelines

### When Debugging:

1. **Check item definition** for basic configuration issues
2. **Check plugin script** for content generation problems  
3. **Check segment definition** for visual grouping issues
4. **Check global config** for path or variable problems

### Debug Commands

```bash
# Enable verbose logging
sketchybar --reload --verbose

# Check individual component
~/.config/sketchybar/plugins/system/battery.sh

# Check if SketchyBar is running
pgrep sketchybar

# Kill and restart
killall sketchybar
brew services restart sketchybar
```

## 📝 Best Practices

### Configuration Management

- **Single source of truth**: Global variables in `config/globals.sh`
- **DRY principle**: No repeated configuration
- **Centralized theming**: All visual aspects controlled from theme files
- **Environment agnostic**: Uses variables for all paths

### Code Quality

1. Follow the established directory structure
2. Update documentation for any changes
3. Test with multiple themes
4. Ensure shell scripts pass shellcheck
5. Use descriptive commit messages

### File Organization

- Keep the main `sketchybarrc` minimal and high-level
- Use descriptive comments in all files
- Group related functionality together
- Avoid hardcoding paths - use variables from `config/globals.sh`
- Test each component independently when possible
- Use consistent styling and formatting across files

## ❌ Anti-Patterns to Avoid

- **Hardcoding paths** - Use variables from `globals.sh`
- **Mixing concerns** - Keep item definition separate from content generation
- **Duplicate configuration** - Use central configuration sources
- **Inconsistent categorization** - Follow established directory structure
- **Complex main config** - Keep `sketchybarrc` high-level only

## 🚀 Architecture Benefits

### Maintainability Focus

- **Easy to locate**: Predictable file locations
- **Easy to modify**: Clear boundaries between components
- **Easy to extend**: Consistent patterns for adding new items
- **Easy to debug**: Isolated component responsibilities

### Future Extensions

This structure supports:
- **Plugin ecosystems**: Easy to add new plugin categories
- **Theme variations**: Centralized theming allows easy theme switching
- **Conditional loading**: Items/segments can be loaded conditionally
- **Modular configuration**: Components can be shared between configurations
- **A/B testing**: Different segments can be swapped easily

## 📚 Self-Documenting Structure

The directory structure itself explains the purpose:
```
segments/right/system_status.sh  # Creates a right-side segment for system status
items/system/battery.sh          # Defines the battery item
plugins/system/battery.sh        # Updates battery content
```

## 🔄 Minimal Coupling

- All files load global configuration from one source
- Plugin paths are centralized in globals
- Theme and icon loading is centralized
- Each component can be modified independently

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
- Check theme-manager.sh output for errors
- Ensure theme file has proper variable exports

### Debug Mode

```bash
# Enable verbose logging
sketchybar --reload --verbose

# Check individual component
~/.config/sketchybar/plugins/system/battery.sh

# Test theme loading
~/.config/sketchybar/themes/theme-manager.sh load
```

### Component Testing

```bash
# Test individual plugins
chmod +x ~/.config/sketchybar/plugins/system/battery.sh
~/.config/sketchybar/plugins/system/battery.sh

# Check plugin permissions
find ~/.config/sketchybar/plugins -name "*.sh" -not -executable

# Validate themes
~/.config/sketchybar/themes/validate-themes.sh
```

---

**Ready to contribute!** Follow these principles and your contributions will integrate seamlessly with the existing architecture.