#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print status messages
print_status() {
    echo -e "${GREEN}[*]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[x]${NC} $1"
}

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    print_error "Please do not run this script as root"
    exit 1
fi

# Check for yay installation
if ! command -v yay &> /dev/null; then
    print_warning "yay not found. Installing yay..."
    
    # Install required packages for building yay
    sudo pacman -S --needed --noconfirm git base-devel
    
    # Clone and install yay
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd -
    rm -rf /tmp/yay
    
    if ! command -v yay &> /dev/null; then
        print_error "Failed to install yay"
        exit 1
    fi
    print_status "yay installed successfully"
else
    print_status "yay is already installed"
fi

# Update package database
print_status "Updating package database..."
yay -Sy --noconfirm

# Define packages to install
packages=(
    # Core System Packages
    "sddm"
    "pacman"
    "polkit-kde-agent"
    "qt5ct"

    # Window Manager and Related
    "hyprland"
    "hyprpaper"
    "waybar"
    "rofi"
    "wl-clipboard"
    "cliphist"

    # Terminal and Shell
    "alacritty"
    "bash"
    "starship"

    # File Manager
    "yazi"

    # System Information
    "neofetch"

    # Waybar Modules
    "playerctl"
    "pavucontrol"
    "networkmanager"
    "nm-connection-editor"
    "waypaper"
    "dunst"

    # System Utilities
    "wlogout"
    "df"
    "calendar"
    "tray"
    "nm-applet"

    # Fonts
    "ttf-font-awesome"
    "ttf-nerd-fonts-symbols"
    "ttf-jetbrains-mono-nerd"
    "ttf-segoe-ui"

    # Audio
    "pulseaudio"
    "pavucontrol"

    # Network
    "networkmanager"
    "nm-connection-editor"

    # System Monitoring
    "htop"
    "lm_sensors"

    # Qt and Wayland
    "qt5-wayland"
    "qt6-wayland"
    "qt5-quickcontrols2"
    "qt5-graphicaleffects"
    "qt5-declarative"
    "qt5-svg"
    "qt5-quickcontrols"
)

# Install packages
print_status "Installing packages..."
for package in "${packages[@]}"; do
    print_status "Installing $package..."
    yay -S --noconfirm "$package"
done

# Copy configuration files
print_status "Setting up configuration files..."

# Create necessary directories
mkdir -p ~/.config/{hypr,hyprpaper,yazi,alacritty,rofi,neofetch,waybar,starship}
mkdir -p ~/.local/share/sddm/themes

# Copy configurations to their appropriate locations
print_status "Copying configuration files..."

# .config files
cp -r "$(dirname "$0")/../.config/alacritty" ~/.config/
cp -r "$(dirname "$0")/../.config/hypr" ~/.config/
cp -r "$(dirname "$0")/../.config/hyprpaper" ~/.config/
cp -r "$(dirname "$0")/../.config/yazi" ~/.config/
cp -r "$(dirname "$0")/../.config/rofi" ~/.config/
cp -r "$(dirname "$0")/../.config/neofetch" ~/.config/
cp -r "$(dirname "$0")/../.config/waybar" ~/.config/
cp -r "$(dirname "$0")/../.config/starship/starship.toml" ~/.config/starship.toml

# SDDM themes
sudo cp -r "$(dirname "$0")/../.config/sddm/themes" /usr/share/sddm/

# SDDM configuration
sudo cp "$(dirname "$0")/../.config/sddm/sddm.conf" /etc/sddm.conf

# Pacman configuration
sudo cp "$(dirname "$0")/../pacman/pacman.conf" /etc/pacman.conf

# Bash configuration
cp "$(dirname "$0")/../.bashrc" ~/.bashrc

# Initialize starship in bash
if ! grep -q "starship init bash" ~/.bashrc; then
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
fi

print_status "Installation and configuration complete!"
print_warning "Please restart your system or log out and log back in for all changes to take effect." 