# SketchyBar Configuration

Custom SketchyBar setup with deep **Aerospace** window manager integration and segmented design.

## 📸 Screenshots

![SketchyBar Screenshot 1](images/Screenshot%202025-07-30%20at%2004.34.47.png)

![SketchyBar Screenshot 2](images/Screenshot%202025-07-30%20at%2004.36.11.png)

![SketchyBar Screenshot 3](images/Screenshot%202025-07-30%20at%2004.37.04.png)

![SketchyBar Screenshot 4](images/Screenshot%202025-07-30%20at%2004.37.21.png)

> 🔗 **Related Config**: See the [Aerospace configuration](https://github.com/ripple0328/aerospace-config) for the complete window manager setup that powers this status bar.

> ✨ **Recent Update**: Configuration cleaned up to remove unreferenced files. Only actively used components remain for a leaner setup.

## ✨ Current Configuration Features

### 🎯 **Segmented Design**
- **Left Segment 1**: Apple logo + dynamic workspace indicators
- **Left Segment 2**: Chevron + focused app information  
- **Center Segment**: Aerospace mode indicator (when active)
- **Right Segment 1**: System monitoring (CPU, memory, temperature)
- **Right Segment 2**: GitHub notifications
- **Right Segment 3**: System status (battery, volume, calendar, clock)

### 🚀 **Aerospace Integration**
- **Dynamic Workspaces**: Automatically detects and displays all Aerospace workspaces
- **App Icon Expansion**: Shows app icons in active workspaces
- **Mode Indicator**: Visual feedback when in resize, move, or service mode
- **Click Navigation**: Click workspaces to switch, with modifier key support
- **Real-time Updates**: Responds to workspace and mode changes instantly

### 📊 **System Monitoring**
- **CPU Usage**: Real-time CPU percentage with color-coded alerts (green/yellow/orange/red)
- **Memory Usage**: RAM usage percentage with smart color indicators
- **Temperature**: CPU temperature monitoring with multiple detection methods
- **Battery**: Percentage with charging status and visual indicators
- **Volume**: Current level with click-to-adjust functionality
- **Date & Time**: Calendar and clock with app shortcuts
- **Simple CPU**: Real-time CPU usage tracking via built-in commands

### 🔔 **GitHub Integration**
- **Real-time Notifications**: Monitor GitHub notifications with 3-minute updates (180 seconds)
- **Color-coded Types**: Different colors for Issues (green), PRs (magenta), Discussions (white), Commits (white)
- **Interactive Popup**: Hover to see detailed notification list with repo names and titles
- **Priority Alerts**: Red highlighting for important notifications (deprecation, breaking changes)
- **Click Actions**: Click notifications to open directly in browser
- **Notification Count**: Badge showing total unread notification count

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
- **GitHub CLI** (`brew install gh`) - for GitHub notifications
- **jq** (`brew install jq`) - for JSON parsing in GitHub plugin
- **sketchybar-app-font** (`brew install font-sketchybar-app-font`) - for app icons in workspaces
- **Aerospace Config** ([ripple0328/aerospace-config](https://github.com/ripple0328/aerospace-config) for complete integration)

### Optional Temperature Tools
For more accurate temperature readings:
- **iStats** (`gem install iStats`) - preferred method
- **smc** command (if available) - fallback method

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



### 2. Setup GitHub Integration (Optional)

For GitHub notifications support:

```bash
# Authenticate with GitHub CLI
gh auth login

# Test GitHub CLI access
gh api notifications
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
│   ├── system_monitor.sh # CPU, memory, temperature monitoring
│   ├── system_status.sh  # Battery, volume, calendar, clock
│   ├── aerospace_mode.sh # Mode indicator (resize/move/service)
│   ├── github.sh         # GitHub notifications
│   └── spacers.sh        # Visual spacing elements
├── plugins/              # Dynamic content scripts
│   ├── aerospace.sh      # Workspace management & app icons
│   ├── aerospace_mode.sh # Mode detection & display
│   ├── icon_map.sh       # App → icon mapping (216 apps)
│   ├── cpu_simple.sh     # CPU usage monitoring
│   ├── memory.sh         # Memory usage monitoring
│   ├── temperature.sh    # Temperature monitoring
│   ├── battery.sh        # Battery status & charging
│   ├── volume.sh         # Volume level display
│   ├── volume_click.sh   # Volume control interactions
│   ├── clock.sh          # Date/time display
│   ├── calendar.sh       # Calendar display
│   ├── github.sh         # GitHub notifications monitoring
│   ├── front_app.sh      # Current app detection
│   ├── front_app_click.sh # Front app click actions
│   └── workspace_click.sh # Workspace switching logic

```

## 📊 System Monitoring Details

### Real-time System Metrics
The configuration includes a dedicated system monitoring segment with live metrics:

#### 🖥️ **CPU Monitoring**
- **Update Frequency**: Every 2 seconds
- **Data Source**: `top` command for system-wide CPU usage
- **Color Coding**:
  - 🟢 Green: 0-40% (normal)
  - 🟡 Yellow: 40-60% (moderate)
  - 🟠 Orange: 60-80% (high)
  - 🔴 Red: 80%+ (critical)

#### 💾 **Memory Monitoring**  
- **Update Frequency**: Every 5 seconds
- **Data Source**: `vm_stat` for precise memory statistics
- **Color Coding**:
  - 🔵 Blue: 0-50% (normal)
  - 🟡 Yellow: 50-70% (moderate)
  - 🟠 Orange: 70-85% (high)
  - 🔴 Red: 85%+ (critical)

#### 🌡️ **Temperature Monitoring**
- **Update Frequency**: Every 5 seconds
- **Detection Methods** (in order of preference):
  1. `iStats` (requires: `gem install iStats`)
  2. `smc` command (if available)
  3. CPU-based simulation as fallback
- **Color Coding**:
  - 🟢 Green: <60°C (normal)
  - 🟡 Yellow: 60-70°C (warm)
  - 🟠 Orange: 70-80°C (hot)
  - 🔴 Red: 80°C+ (critical)



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
export BLACK=0xff181926   # Black:   #181926
export WHITE=0xffcad3f5   # White:   #cad3f5
export RED=0xffed8796     # Red:     #ed8796
export GREEN=0xffa6da95   # Green:   #a6da95
export BLUE=0xff8aadf4    # Blue:    #8aadf4
export YELLOW=0xffeed49f  # Yellow:  #eed49f
export ORANGE=0xfff5a97f  # Orange:  #f5a97f
export MAGENTA=0xffc6a0f6 # Magenta: #c6a0f6
export GREY=0xff939ab7    # Grey:    #939ab7

# Background colors
export BACKGROUND_1=0x903c3e4f  # Semi-transparent backgrounds
export BACKGROUND_2=0x90494d64
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
| `cpu_simple.sh` | CPU usage monitoring | `top` (built-in) |
| `memory.sh` | Memory usage monitoring | `vm_stat`, `bc` (built-in) |
| `temperature.sh` | Temperature monitoring | `istats` (optional), `smc` (optional) |
| `battery.sh` | Battery status | `pmset` (built-in) |
| `volume.sh` | Volume control | `osascript` (built-in) |
| `github.sh` | GitHub notifications | `gh`, `jq` |
| `icon_map.sh` | App icon mapping | sketchybar-app-font |
| `clock.sh` | Date/time display | `date` (built-in) |
| `calendar.sh` | Calendar display | `date` (built-in) |
| `front_app.sh` | Current app detection | Built-in |
| `front_app_click.sh` | Front app click actions | Built-in |
| `workspace_click.sh` | Workspace switching logic | Aerospace |
| `volume_click.sh` | Volume control interactions | `osascript` (built-in) |

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

3. **System monitoring not showing readings**
   ```bash
   # Test individual plugins
   NAME=cpu_simple ~/.config/sketchybar/plugins/cpu_simple.sh
   NAME=memory ~/.config/sketchybar/plugins/memory.sh  
   NAME=temperature ~/.config/sketchybar/plugins/temperature.sh
   
   # Check if required tools are available
   which top vm_stat bc
   ```

4. **Temperature readings showing "--°C"**
   ```bash
   # Install iStats for accurate readings
   gem install iStats
   
   # Or test fallback temperature calculation
   top -l 1 -s 0 | grep "CPU usage"
   ```

5. **App icons missing in workspaces**
   ```bash
   # Check if sketchybar-app-font is installed
   ls ~/Library/Fonts/ | grep -i "sketchybar-app-font"
   
   # Test icon mapping
   ~/.config/sketchybar/plugins/icon_map.sh "Google Chrome"
   ```



7. **GitHub notifications not showing**
   ```bash
   # Check GitHub CLI authentication
   gh auth status
   
   # Test API access
   gh api notifications
   
   # Check dependencies
   which gh jq
   
   # Test plugin manually
   NAME=github.bell ~/.config/sketchybar/plugins/github.sh
   ```

### Testing

Test individual components manually to verify functionality:

```bash
# Test mode indicator manually
aerospace mode service
sketchybar --trigger aerospace_mode_change AEROSPACE_MODE=service

# Test workspace switching
aerospace workspace 1
sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=1
```

---

**Related**: See the [Aerospace configuration](https://github.com/ripple0328/aerospace-config) for the complete window manager setup.