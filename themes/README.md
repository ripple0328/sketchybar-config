# SketchyBar Theme System

A modern, semantic color theme system for SketchyBar with industry-standard naming conventions.

## 🎨 Visual Theme Creator's Guide

> **"I want to create a theme, but what does each color actually control?"**

### 🖼️ Your SketchyBar in Action

![SketchyBar Example](../images/Screenshot%202025-07-30%20at%2022.49.07.png)

*Above: A real SketchyBar showing workspace [1], current app "aerospace", system stats, and time display*

### 📋 Your SketchyBar Layout Breakdown

Here's what each element in the screenshot above does and what color variable controls it:

```text
┌─ BACKGROUND_PRIMARY ───────────────────────────────────────────────────────────┐
│                                                                                │
│  🍎① [1]② [2]③ [3]④  📁 VS Code⑤  📊⑥ 85%⑦  🔔⑧  🔋⑨ 100%⑩  22:37⑪ │
└────────────────────────────────────────────────────────────────────────────────┘
```

Numbers ①–⑪ correspond to the color variables below.

### 🎯 Color Variable Mapping

| # | What You See | Color Variable | Impact Level | Description |
|:-:|---|---|:---:|---|
| ① | 🍎 **Apple Logo** | `ICON_PRIMARY` | 🔥 HIGH | The colorful Apple menu icon |
| ② | **[1]** Active Workspace | `WORKSPACE_ACTIVE` | 🔥 HIGH | Blue highlight around current workspace |
| ③④ | **[2] [3]** Inactive Workspaces | `TEXT_SECONDARY` | 🟡 MEDIUM | Dimmed workspace numbers |
| ⑤ | **📁 VS Code** App Name | `TEXT_PRIMARY` | 🔥 HIGH | Current application name (white text) |
| ⑥ | **📊** System Stats Icon | `ACCENT_PRIMARY` | 🔥 HIGH | CPU, memory, temperature icons |
| ⑦ | **85%** Numbers/Values | `TEXT_PRIMARY` | 🔥 HIGH | All percentage and numeric displays |
| ⑧ | **🔔 0** GitHub Bell | `STATE_WARNING` | 🟡 MEDIUM | Notification bell (orange when active) |
| ⑨ | **🔋** Battery Icon | `ICON_PRIMARY` | 🔥 HIGH | Battery icon |
| ⑩ | **100%** Battery Value | `TEXT_PRIMARY` | 🔥 HIGH | Battery percentage |
| ⑪ | **22:37** Time | `TEXT_PRIMARY` | 🔥 HIGH | Clock display |
| — | **Bar Background** | `BACKGROUND_PRIMARY` | 🔥 HIGH | The entire bar's background color |

### 🚀 Theme Creation Walkthrough

**Step 1: Start with the "Big 4" colors** ⭐
These have the most visual impact:

1. **`BACKGROUND_PRIMARY`** → Change the entire bar color

   ```bash
   export BACKGROUND_PRIMARY=0xff1a1b26  # Dark blue background
   ```

2. **`TEXT_PRIMARY`** → Change all main text (VS Code, 100%, 22:37)

   ```bash
   export TEXT_PRIMARY=0xfff7768e        # Pink text
   ```

3. **`ICON_PRIMARY`** → Change Apple logo, battery, app icons

   ```bash
   export ICON_PRIMARY=0xff9ece6a        # Green icons
   ```

4. **`WORKSPACE_ACTIVE`** → Change active workspace highlight

   ```bash
   export WORKSPACE_ACTIVE=0xff7aa2f7    # Blue highlight
   ```

**Step 2: Test your changes** 🧪

```bash
# Save your theme file
# Then reload SketchyBar
sketchybar --reload

# You'll immediately see:
# - Different bar background color
# - New text colors for "VS Code", "100%", "22:37"
# - Different Apple logo color
# - New workspace highlight color
```

**Step 3: Fine-tune with secondary colors** ✨

1. **`ACCENT_PRIMARY`** → System monitor icons (📊 🌡️)
2. **`TEXT_SECONDARY`** → Inactive workspace numbers [2] [3]
3. **`STATE_WARNING`** → GitHub notification bell
4. **`STATE_SUCCESS`** → Success indicators (green states)
5. **`STATE_ERROR`** → Error indicators (red alerts)

### 💡 Pro Tips for Theme Creators

- **Start simple**: Change just `BACKGROUND_PRIMARY` and `TEXT_PRIMARY` first
- **Test immediately**: Run `sketchybar --reload` after each change
- **Use contrast**: Ensure text is readable on your background
- **Check all states**: Test with notifications, different apps, battery levels
- **Copy existing themes**: Look at `catppuccin.theme.sh` as a starting point

### 🎨 Real Example

Here's how changing just 2 colors transforms your bar:

```bash
# Before (default)
export BACKGROUND_PRIMARY=0xff24273a    # Dark gray
export TEXT_PRIMARY=0xffcad3f5          # Light text

# After (custom)
export BACKGROUND_PRIMARY=0xff1a1b26    # Navy blue  
export TEXT_PRIMARY=0xfff7768e          # Pink text

# Result: Navy blue bar with pink text - completely different look!
```

> **Ready to create?** Copy `template.sh` to `my-theme.theme.sh` and start with these 4 colors!

### 🎯 Essential Color Variables

**Start with these 5 core colors for immediate visual impact:**

| Priority | Variable | Controls | Example in Bar |
|:---:|---|---|---|
| 1 | `BACKGROUND_PRIMARY` | Bar background | The dark background behind everything |
| 2 | `TEXT_PRIMARY` | Main text | "VS Code", "100%", "22:37" |
| 3 | `ICON_PRIMARY` | Icon colors | 🍎 Apple logo, 🔋 battery icon |
| 4 | `ACCENT_PRIMARY` | Highlights | 📊 System monitor icons, active states |
| 5 | `WORKSPACE_ACTIVE` | Active workspace | Blue highlight around current workspace |

**Then refine with secondary colors:**

| Variable | Controls | Visual Impact |
|---|---|---|
| `TEXT_SECONDARY` | Inactive elements | Dimmed workspace numbers [2] [3] |
| `STATE_WARNING` | Alerts & notifications | 🔔 GitHub bell when active |
| `STATE_SUCCESS` | Success states | Green indicators, positive status |
| `STATE_ERROR` | Error states | Red alerts, critical warnings |

> 💡 **Quick Test**: Change `BACKGROUND_PRIMARY` to see the entire bar color shift, then adjust `TEXT_PRIMARY` to see all text elements update instantly!

## 🎨 Design Philosophy

### Semantic Naming

Colors are named by **purpose**, not appearance:

```bash
# ✅ Purpose-based (clear intent)
TEXT_PRIMARY, BACKGROUND_SECONDARY, FEEDBACK_ERROR, ACCENT_PRIMARY

# ❌ Appearance-based (unclear usage)
WHITE, GRAY, RED, BLUE
```

### Theme Independence

- **Same code works across all themes** - switch themes without changing configuration
- **Automatic adaptation** - colors change based on semantic meaning
- **Consistent behavior** - similar purposes always look similar

## 🏗️ Color Architecture

### **Surface Colors** (Backgrounds & Layers)

```bash
BACKGROUND_PRIMARY      # Main app background
BACKGROUND_SECONDARY    # Card/section backgrounds
BACKGROUND_TERTIARY     # Subtle section backgrounds
SURFACE_OVERLAY         # Modal/popup backgrounds
SURFACE_ELEVATED        # Raised card backgrounds
```

### **Content Colors** (Text & Icons)

```bash
TEXT_PRIMARY           # Main content text
TEXT_SECONDARY         # Supporting text
TEXT_TERTIARY          # Subtle/disabled text
TEXT_INVERSE           # Text on colored backgrounds
ICON_PRIMARY           # Main icons
ICON_SECONDARY         # Supporting icons
```

### **Interactive Colors** (Actions & Controls)

```bash
ACCENT_PRIMARY         # Primary brand actions
ACCENT_SECONDARY       # Secondary actions
INTERACTIVE_HOVER      # Hover states
INTERACTIVE_ACTIVE     # Pressed states
INTERACTIVE_DISABLED   # Disabled states
INTERACTIVE_FOCUS      # Focus outlines
```

### **Feedback Colors** (Status & Alerts)

```bash
FEEDBACK_SUCCESS       # Success states (✅)
FEEDBACK_WARNING       # Warning states (⚠️)
FEEDBACK_ERROR         # Error states (❌)
FEEDBACK_INFO          # Informational states (ℹ️)
```

### **Border Colors** (Dividers & Outlines)

```bash
BORDER_PRIMARY         # Main borders
BORDER_SECONDARY       # Subtle borders
BORDER_FOCUS           # Focus outlines
BORDER_DIVIDER         # Section separators
```

## 🎯 Available Themes

- **🌸 Catppuccin** - Modern pastel theme with soothing colors
- **🌃 Tokyo Night** - Dark theme with bright blue accents
- **🍂 Gruvbox** - Warm retro color scheme with earth tones
- **❄️ Nord** - Arctic, minimalist blue palette
- **🧛 Dracula** - Dark theme with vibrant purple accents
- **💧 Fluid Glass** - Translucent frosted-glass theme

## 🛠️ Using Themes

### Basic Usage

```bash
# Cycle to the next theme
../themes/theme-manager.sh

# Apply a specific theme
../themes/theme-manager.sh tokyo-night

# Load the current theme's colors (for scripts)
source <(../themes/theme-manager.sh load)
```

### Shell Integration

Add to your `.zshrc` or `.bashrc`:

```bash
alias theme='~/.config/sketchybar/themes/theme-manager.sh'
```

Then use: `theme` to cycle, or `theme nord` to apply a specific theme.

## 🆕 Creating New Themes

Creating a new theme is simple and requires no manual script editing. The theme manager will automatically discover any valid theme file.

### Step 1: Copy Template

All theme files must follow the `<name>.theme.sh` naming convention.

```bash
cp template.sh my-awesome-theme.theme.sh
```

### Step 2: Customize Colors

Edit your new `my-awesome-theme.theme.sh` file and change the color values to match your desired palette:

```bash
# Example: Ocean theme
export BACKGROUND_PRIMARY=0xff0f1419      # Deep ocean blue
export TEXT_PRIMARY=0xffe6e1cf            # Light sand
export ACCENT_PRIMARY=0xff36a3d9          # Ocean blue
export FEEDBACK_SUCCESS=0xff7fd962        # Sea green
export FEEDBACK_ERROR=0xfff07178          # Coral red
```

### Step 3: Apply Your Theme

Your theme is now instantly available. Apply it using the `theme-manager.sh` script:

```bash
../themes/theme-manager.sh my-awesome-theme
```

The theme manager automatically lists, validates, and manages your new theme.

## ✅ Theme Validation

Validate your theme has all required colors:

```bash
./validate-themes.sh
```

This ensures your theme is complete and compatible.

## 📋 Required Colors

Every theme must define these semantic colors:

### Core Requirements

- **Surfaces**: `BACKGROUND_PRIMARY`, `BACKGROUND_SECONDARY`, `BACKGROUND_TERTIARY`
- **Content**: `TEXT_PRIMARY`, `TEXT_SECONDARY`, `ICON_PRIMARY`
- **Interactive**: `ACCENT_PRIMARY`, `INTERACTIVE_HOVER`, `INTERACTIVE_FOCUS`
- **Feedback**: `FEEDBACK_SUCCESS`, `FEEDBACK_WARNING`, `FEEDBACK_ERROR`
- **Borders**: `BORDER_PRIMARY`, `BORDER_FOCUS`

### System Integration

- **Status**: `STATUS_SUCCESS`, `STATUS_WARNING`, `STATUS_ERROR`
- **Workspaces**: `WORKSPACE_ACTIVE`, `WORKSPACE_HOVER`
- **SketchyBar**: `TRANSPARENT`, `ICON_COLOR`, `LABEL_COLOR`
- **Typography**: `FONT`, `FONT_FAMILY_PRIMARY`, `FONT_SIZE_*`

## 🎨 Design Guidelines

### Color Accessibility

- Maintain **4.5:1 contrast ratio** for text
- Test with **color blindness simulators**
- Use **semantic names** to support accessibility tools

### Visual Consistency

- Similar purposes should have **similar brightness/saturation**
- `ACCENT_PRIMARY` should reflect **brand identity**
- `FEEDBACK_*` colors should follow **universal conventions**

### Brand Considerations

- **Primary accent** represents your brand
- **Success/Error** colors follow standard conventions (green/red)
- **Backgrounds** should support comfortable long-term viewing

## 🚀 Advanced Features

### Dynamic Loading

Themes are loaded dynamically without restart:

```bash
# Themes reload automatically via theme-manager.sh
source <(~/.config/sketchybar/themes/theme-manager.sh load)
```

### System Integration

Semantic colors automatically integrate with:

- **Battery status** (charging=success, low=error)
- **CPU monitoring** (high usage=warning, normal=success)
- **Memory monitoring** (high usage=warning)
- **Temperature monitoring** (high temp=error)

### Multi-State Support

Colors adapt to different states:

```bash
# Configuration stays the same
icon.color=$STATUS_SUCCESS

# Colors adapt based on theme:
# Catppuccin: STATUS_SUCCESS = soft green (#a6da95)
# Tokyo Night: STATUS_SUCCESS = bright green (#9ece6a)
# Gruvbox: STATUS_SUCCESS = warm green (#b8bb26)
```

## 🔄 Recent Improvements (2025)

### Performance & Maintainability Updates

- **🧹 Code cleanup**: Removed 37 unused legacy variables from all themes
- **🎨 Workspace highlighting**: Fixed `WORKSPACE_ACTIVE` color transparency for proper visual feedback
- **📝 Font system**: Added consistent `FONT` variable support across all themes
- **⚡ Performance**: Reduced theme file sizes by ~25% for faster loading
- **🛠️ Maintainability**: Simplified codebase with only actively used variables

### What Was Fixed

- **Workspace Colors**: `WORKSPACE_ACTIVE` now uses semi-transparent blue (`0x998aadf4`) for proper highlighting
- **Font Integration**: All themes now properly define `FONT="$FONT_FAMILY_PRIMARY"` for SketchyBar
- **Variable Cleanup**: Removed unused compatibility variables while keeping essential aliases
- **Cross-theme Consistency**: All 5 themes now have identical structure and functionality

### Removed Legacy Variables

```bash
# These variables were removed as they were unused:
BLACK, WHITE, RED, GREEN, BLUE, ORANGE, MAGENTA, GREY
BAR_COLOR, BACKGROUND_3, HOVER_COLOR, ACTIVE_GLOW
GLASS_LIGHT, GLASS_DARK, BATTERY_LOW, CPU_HIGH
GRADIENT_START, SHADOW_COLOR, ICON_HIGHLIGHT
```

### Kept Essential Variables

```bash
# Only variables actually used by SketchyBar are kept:
TRANSPARENT, ICON_COLOR, LABEL_COLOR, FONT
BACKGROUND_1, BACKGROUND_2, POPUP_BACKGROUND_COLOR
ACCENT_COLOR, SUCCESS_COLOR, WARNING_COLOR, ERROR_COLOR
WORKSPACE_ACTIVE, WORKSPACE_INACTIVE, BORDER_FOCUS
```

## 🔧 Technical Details

### File Structure

```text
themes/
├── README.md                 # This documentation
├── template.sh               # Template for new themes
├── catppuccin.theme.sh       # Catppuccin theme
├── tokyo-night.theme.sh      # Tokyo Night theme
├── gruvbox.theme.sh          # Gruvbox theme
├── nord.theme.sh             # Nord theme
├── dracula.theme.sh          # Dracula theme
├── theme-manager.sh          # Consolidated theme script
└── validate-themes.sh        # Validation script
```

### Color Format

All colors use ARGB hex format:

```bash
export COLOR_NAME=0xffrrggbb
#                   ^^ ^^ ^^
#                   |  |  └─ Blue (00-FF)
#                   |  └──── Green (00-FF)
#                   └─────── Red (00-FF)
# Alpha is always FF (opaque) for solid colors
```

---

**Ready to create amazing themes!** 🎨✨

*This theme system follows industry standards from Google Material Design, Adobe Spectrum, and other leading design systems.*
