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

## 🎨 Themes

Multiple themes available with semantic color system. See [themes/README.md](themes/README.md) for complete documentation and usage.

## 📚 CONTRIBUTIE

- **[CONTRIBUTING.md](CONTRIBUTING.md)** - Developer guidelines and troubleshooting
