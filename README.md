# SketchyBar Configuration

A modern, segmented status bar configuration for macOS with deep **Aerospace** window manager integration.

![SketchyBar Preview](preview.png)

## ✨ Features

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

## 📋 Prerequisites

### Required Dependencies

1. **SketchyBar**
   ```bash
   brew install FelixKratz/formulae/sketchybar
   ```

2. **Aerospace Window Manager**
   ```bash
   brew install --cask nikitabobko/tap/aerospace
   ```

3. **MesloLGS Nerd Font**
   ```bash
   brew install font-meslo-lg-nerd-font
   # Or download from: https://github.com/ryanoasis/nerd-fonts/releases
   ```

### Optional Dependencies

4. **sketchybar-app-font** (for app icons)
   ```bash
   curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.16/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
   ```

## 🛠️ Installation

### 1. Install SketchyBar Configuration

```bash
# Clone or copy the configuration to your .config directory
cp -r /path/to/sketchybar ~/.config/

# Make scripts executable
chmod +x ~/.config/sketchybar/sketchybarrc
chmod +x ~/.config/sketchybar/plugins/*.sh
chmod +x ~/.config/sketchybar/items/*.sh
```

### 2. Build the Helper Program (Optional)

The C helper provides enhanced CPU monitoring:

```bash
cd ~/.config/sketchybar/helper
make
```

### 3. Configure Aerospace Integration

Add to your `~/.config/aerospace/aerospace.toml`:

```toml
# SketchyBar integration
[mode.main.binding]
# ... your other bindings ...

[on-window-detected]
if.app-id = 'com.apple.systempreferences'
run = 'sketchybar --trigger aerospace_workspace_change'

# Optional: Add mode change triggers
[mode.service.binding]
cmd = 'sketchybar --trigger aerospace_mode_change AEROSPACE_MODE=service'

[mode.resize.binding] 
cmd = 'sketchybar --trigger aerospace_mode_change AEROSPACE_MODE=resize'

[mode.move.binding]
cmd = 'sketchybar --trigger aerospace_mode_change AEROSPACE_MODE=move'
```

### 4. Start SketchyBar

```bash
# Start SketchyBar
brew services start sketchybar

# Or start manually
sketchybar
```

## ⚙️ Configuration

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

### Common Issues

1. **SketchyBar not starting**
   ```bash
   # Check if SketchyBar is installed
   which sketchybar
   
   # View logs
   tail -f /var/log/sketchybar.log
   ```

2. **Aerospace events not working**
   ```bash
   # Test aerospace commands
   aerospace list-workspaces --all
   aerospace list-windows --focused
   
   # Check if events are registered
   sketchybar --query default
   ```

3. **Icons not displaying**
   ```bash
   # Verify font installation
   fc-list | grep -i "meslo"
   ls ~/Library/Fonts/ | grep -i "sketchybar-app-font"
   ```

4. **Helper program not working**
   ```bash
   # Rebuild the helper
   cd ~/.config/sketchybar/helper
   make clean && make
   ```

### Testing Scripts

Use the included test scripts to verify functionality:

```bash
# Test Aerospace mode indicator
~/.config/sketchybar/test_aerospace_mode.sh

# Test improved mode indicator
~/.config/sketchybar/test_improved_mode.sh
```

## 📚 Further Resources

- [SketchyBar Documentation](https://felixkratz.github.io/SketchyBar/)
- [Aerospace Documentation](https://nikitabobko.github.io/AeroSpace/)
- [Nerd Fonts](https://www.nerdfonts.com/)
- [Catppuccin Color Palette](https://catppuccin.com/)

## 🤝 Contributing

Feel free to submit issues, feature requests, or improvements. This configuration is designed to be modular and easily customizable.

## 📄 License

This configuration is provided as-is. Feel free to modify and distribute according to your needs.