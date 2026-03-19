#!/data/data/com.termux/files/usr/bin/bash

# Termux Pro Theme Installer v1.0
# Author: Your Name

clear
echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo "┃         Termux Pro Theme Installation            ┃"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
sleep 1

# Check storage permission
echo "[*] Setting up storage permission..."
termux-setup-storage

# Update and install packages
echo "[*] Installing required packages..."
pkg update -y && pkg upgrade -y
pkg install -y zsh git nano curl wget neofetch python fzf

# Install Oh My Zsh
echo "[*] Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install plugins
echo "[*] Installing plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 2>/dev/null
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 2>/dev/null

# Copy configuration files
echo "[*] Applying configurations..."
cp zshrc.conf ~/.zshrc
cp colors.properties ~/.termux/colors.properties 2>/dev/null || mkdir -p ~/.termux && cp colors.properties ~/.termux/colors.properties
cat alias.sh >> ~/.zshrc

# Set ZSH as default
echo "[*] Setting ZSH as default shell..."
chsh -s zsh

# Reload settings
echo "[*] Reloading Termux settings..."
termux-reload-settings 2>/dev/null

clear
echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo "┃        Tʜᴇᴍᴇ Fᴜʟʟʏ Iɴsᴛᴀʟʟᴇᴅ! 🎉                 ┃"
echo "┃                                                   ┃"
echo "┃         Cʀᴇᴀᴛᴏʀ Lᴜᴄɪғᴇʀ 💀                     ┃"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"