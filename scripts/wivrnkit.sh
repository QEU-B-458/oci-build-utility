#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
pacman -Syu --noconfirm --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru && makepkg -s --noconfirm && cd ..
grep -v '^#' ./wivrnkit.packages | xargs paru -S --noconfirm --needed

wget https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage -O /usr/local/bin/appimagetool
chmod +x /usr/local/bin/appimagetool

wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage -O /usr/local/bin/linuxdeploy
chmod +x /usr/local/bin/linuxdeploy
