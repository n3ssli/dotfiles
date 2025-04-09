# Dotfiles

My personal dotfiles configuration for Arch Linux with Hyprland.

## Configuration Contents

- **Window Manager**: Hyprland
- **Display Manager**: SDDM
- **Terminal**: Alacritty
- **Shell**: Bash with Starship prompt
- **File Manager**: Yazi
- **Application Launcher**: Rofi
- **Status Bar**: Waybar
- **System Information**: Neofetch
- **Package Manager**: Pacman

## Installation

1. Clone the repository:
   ```bash
   git clone --recursive https://github.com/n3ssli/dotfiles.git
   cd dotfiles
   ```

2. Run the installation script:
   ```bash
   ./scripts/install.sh
   ```

The script will:
- Install yay if not present
- Install all required packages
- Set up all configurations
- Initialize starship prompt

## Features

- Custom SDDM themes
- Hyprland window manager configuration
- Waybar status bar with various modules
- Rofi application launcher with custom theme
- Alacritty terminal with custom configuration
- Starship prompt configuration
- Neofetch with custom ASCII art
- Yazi file manager configuration

## Submodules

This repository uses git submodules for:
- [Hyprland](https://github.com/hyprwm/Hyprland)
- [Waybar](https://github.com/Alexays/Waybar)

## License

This repository is licensed under the MIT License - see the LICENSE file for details. 