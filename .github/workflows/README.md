# SketchyBar CI/CD

This directory contains GitHub Actions workflows for automated linting and testing of the SketchyBar configuration.

## Continuous Integration (`ci.yml`)

Automatically runs on every push and pull request to the main and develop branches.

### What it does:
- **ShellCheck**: Lints all shell scripts (`.sh` files and `sketchybarrc`)
- **Theme Validation**: Runs the theme validation script to ensure all themes have required color definitions
- **Markdown Linting**: Validates README and documentation files
- **Permission Checks**: Ensures scripts are executable (auto-fixes if needed)
- **Theme Switching Test**: Verifies theme management tools are working

### Triggered by:
- Push to `main` or `develop` branches
- Pull requests targeting `main` or `develop` branches

### Configuration files:
- `.shellcheckrc` - ShellCheck configuration optimized for SketchyBar scripts
- `.markdownlint.json` - Markdownlint configuration for documentation

### Local testing:
You can run the same checks locally before pushing:

```bash
# Check shell scripts
find . -type f \( -name "*.sh" -o -name "sketchybarrc" \) -exec shellcheck {} \;

# Validate themes
./themes/validate-themes.sh

# Lint markdown files
markdownlint **/*.md

# Test theme validation
./themes/validate-themes.sh

# Check if scripts are executable
find . -name "*.sh" ! -executable -ls
```

### What gets checked:
- All shell scripts in `plugins/`, `items/`, `themes/` directories
- The main `sketchybarrc` configuration file
- Theme color definitions and completeness
- Markdown documentation files
- Script permissions and executability