# Contributing to SketchyBar Configuration

This document provides comprehensive guidelines for contributors and developers working with this SketchyBar configuration.

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

### 4. **Consistent Naming**

- **Items**: `category/function.sh` (e.g., `system/battery.sh`)
- **Plugins**: `category/function_action.sh` (e.g., `system/battery_update.sh`) or `category/function.sh`
- **Segments**: `position/description.sh` (e.g., `right/system_status.sh`)
- **Config**: `purpose.sh` (e.g., `globals.sh`, `defaults.sh`)

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

---

**Ready to contribute!** Follow these principles and your contributions will integrate seamlessly with the existing architecture.