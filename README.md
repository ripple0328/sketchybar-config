# SketchyBar Configuration

Custom SketchyBar setup with deep **Aerospace** window manager integration and segmented design.

> 🔗 **Related Config**: See the [Aerospace configuration](https://github.com/ripple0328/aerospace-config) for the complete window manager setup that powers this status bar.

## ✨ Current Configuration Features

### 🎯 **Segmented Design**
- **Left Segment 1**: Apple logo + dynamic workspace indicators
- **Left Segment 2**: Chevron + focused app information  
- **Center Segment**: Aerospace mode indicator (when active)
- **Right Segment**: System status (battery, volume, calendar, clock)

### 🚀 **Aerospace Integration**
- **Dynamic Workspaces**: Automatically detects and displays all Aerospace workspaces
- **App Icon Expansion**: Shows app icons in active workspaces
- **Mode Indicator**: Visual feedback when in resize, move, or service mode
- **Click Navigation**: Click workspaces to switch, with modifier key support
- **Real-time Updates**: Responds to workspace and mode changes instantly

### 📊 **System Monitoring**
- **Battery**: Percentage with charging status and visual indicators
- **Volume**: Current level with click-to-adjust functionality
- **Date & Time**: Calendar and clock with app shortcuts
- **CPU Monitoring**: Advanced CPU usage tracking via custom C helper

### 🎨 **Visual Design**
- **Catppuccin Color Scheme**: Modern, eye-friendly color palette
- **Nerd Font Icons**: Rich iconography with proper app recognition
- **Adaptive Spacing**: Smart padding and segment sizing
- **Smooth Animations**: Polished visual feedback

## 📋 Dependencies

This configuration requires:
- **SketchyBar** (`brew install FelixKratz/formulae/sketchybar`)
- **Aerospace** (`brew install --cask nikitabobko/tap/aerospace`) 
- **MesloLGS Nerd Font** (`brew install font-meslo-lg-nerd-font`)
- **sketchybar-app-font** (optional, for app icons in workspaces)
- **Aerospace Config** ([ripple0328/aerospace-config](https://github.com/ripple0328/aerospace-config) for complete integration)

## 🛠️ Setup

### 1. Install Configuration

```bash
# Clone the SketchyBar configuration
git clone https://github.com/ripple0328/sketchybar-config.git ~/.config/sketchybar

# Make scripts executable
chmod +x ~/.config/sketchybar/sketchybarrc
chmod +x ~/.config/sketchybar/plugins/*.sh
chmod +x ~/.config/sketchybar/items/*.sh
```

### 2. Build Helper Program (Optional)

Enhanced CPU monitoring via custom C helper:

```bash
cd ~/.config/sketchybar/helper
make
```

### 3. Start SketchyBar

```bash
brew services start sketchybar
```

## 📁 Configuration Structure

```
sketchybar/
├── sketchybarrc           # Main configuration entry point
├── colors.sh              # Catppuccin color scheme
├── icons.sh               # Nerd font icon definitions
├── items/                 # Individual bar item configurations
│   ├── apple.sh          # Apple logo
│   ├── workspaces.sh     # Aerospace workspace indicators  
│   ├── app_info.sh       # Current app display
│   ├── system_status.sh  # Battery, volume, calendar, clock
│   ├── aerospace_mode.sh # Mode indicator (resize/move/service)
│   └── spacers.sh        # Visual spacing elements
├── plugins/              # Dynamic content scripts
│   ├── aerospace.sh      # Workspace management & app icons
│   ├── aerospace_mode.sh # Mode detection & display
│   ├── icon_map.sh       # App → icon mapping (216 apps)
│   ├── battery.sh        # Battery status & charging
│   ├── volume.sh         # Volume level display
│   ├── workspace_click.sh # Workspace switching logic
│   └── *.sh              # Additional system monitors
└── helper/               # C program for advanced CPU monitoring
    ├── helper.c          # Main program
    ├── cpu.h             # CPU monitoring functions
    └── Makefile          # Build configuration
```

## 🚀 Aerospace Integration Details

This configuration deeply integrates with the [Aerospace window manager configuration](https://github.com/ripple0328/aerospace-config), providing:

### Workspace Detection & Display
- **Auto-discovery**: Reads all workspaces from `aerospace list-workspaces --all`
- **Current workspace**: `1, 2, 3, A, B, C, E, T, M, Z` (see Aerospace config for meanings)
- **Visual states**: Different styling for focused vs unfocused workspaces
- **App icons**: Shows app icons for windows in each workspace using app detection

### Mode Indicators
- **Service Mode**: Red indicator when in Aerospace service mode
- **Resize Mode**: Visual feedback during window resizing operations  
- **Move Mode**: Shows when moving windows between workspaces
- **Click to exit**: Click mode indicator to return to main mode

### Interactive Features
- **Left click**: Switch to workspace (`aerospace workspace $id`)
- **Cmd+click**: Move window to workspace and follow
- **Option+click**: Move window to workspace but stay in current
- **Real-time updates**: Responds to `aerospace_workspace_change` events

## ⚙️ Customization

### 🎨 **Customizing Colors**

Edit `colors.sh` to modify the color scheme:

```bash
# Catppuccin color palette
export BLACK=0xff181926
export WHITE=0xffcad3f5
export RED=0xffed8796
export GREEN=0xffa6da95
export BLUE=0xff8aadf4
# ... customize as needed
```

### 🔠 **Changing Fonts**

Modify the font in `sketchybarrc`:

```bash
FONT="MesloLGS Nerd Font"  # Change to your preferred Nerd Font
```

### 🖱️ **Adding Click Actions**

Example for adding custom click scripts:

```bash
sketchybar --add item my_item right \
           --set my_item \
           script="$PLUGIN_DIR/my_script.sh" \
           click_script="echo 'Clicked!'"
```

### ➕ **Adding New Items**

1. Create a new item file in `items/`:
   ```bash
   touch ~/.config/sketchybar/items/my_item.sh
   ```

2. Add the item configuration:
   ```bash
   #!/usr/bin/env sh
   sketchybar --add item my_item right \
              --set my_item \
              icon="🎵" \
              script="$PLUGIN_DIR/my_plugin.sh" \
              update_freq=30
   ```

3. Source it in `sketchybarrc`:
   ```bash
   source "$ITEM_DIR/my_item.sh"
   ```

## 🔧 Plugin Scripts

### Core Plugins

| Plugin | Purpose | Dependencies |
|--------|---------|--------------|
| `aerospace.sh` | Workspace management and app icons | Aerospace |
| `aerospace_mode.sh` | Mode indicator | Aerospace |
| `battery.sh` | Battery status | `pmset` (built-in) |
| `volume.sh` | Volume control | `osascript` (built-in) |
| `icon_map.sh` | App icon mapping | sketchybar-app-font |
| `clock.sh` | Date/time display | `date` (built-in) |

### Custom Scripts

- **Workspace Navigation**: `workspace_click.sh` - Handles workspace switching
- **Volume Control**: `volume_click.sh` - Interactive volume adjustment
- **App Launching**: Click actions for calendar, clock apps

## 🎯 Aerospace Integration Details

### Workspace Display
- **Dynamic Detection**: Automatically discovers all configured workspaces
- **Visual States**: Different styles for focused, occupied, and empty workspaces
- **App Icons**: Shows app icons for applications in each workspace
- **Smart Updates**: Refreshes when windows move between workspaces

### Mode Indicator
- **Service Mode**: Shows when in Aerospace service mode
- **Resize Mode**: Visual feedback during window resizing
- **Move Mode**: Indicates when moving windows
- **Click to Exit**: Click the mode indicator to return to main mode

### Click Interactions
- **Left Click**: Switch to workspace
- **Cmd+Click**: Move current window to workspace and follow
- **Option+Click**: Move current window to workspace (stay in current)

## 🔍 Troubleshooting

### Configuration-Specific Issues

1. **Aerospace workspace not updating**
   ```bash
   # Test aerospace commands work
   aerospace list-workspaces --all
   aerospace list-windows --focused
   
   # Check workspace file is created
   cat /tmp/sketchybar_workspace_items
   ```

2. **Mode indicator not showing**
   ```bash
   # Test mode changes manually
   aerospace mode service
   sketchybar --trigger aerospace_mode_change AEROSPACE_MODE=service
   
   # Return to main mode
   aerospace mode main
   ```

3. **App icons missing in workspaces**
   ```bash
   # Check if sketchybar-app-font is installed
   ls ~/Library/Fonts/ | grep -i "sketchybar-app-font"
   
   # Test icon mapping
   ~/.config/sketchybar/plugins/icon_map.sh "Google Chrome"
   ```

4. **Helper program CPU monitoring not working**
   ```bash
   # Rebuild the helper
   cd ~/.config/sketchybar/helper
   make clean && make
   
   # Test manually
   ./helper cpu
   ```

### Testing

Use included test scripts to verify Aerospace integration:

```bash
# Test mode indicator with different Aerospace modes
~/.config/sketchybar/test_aerospace_mode.sh

# Test improved mode functionality  
~/.config/sketchybar/test_improved_mode.sh
```

---

**Related**: See the [Aerospace configuration](https://github.com/ripple0328/aerospace-config) for the complete window manager setup.