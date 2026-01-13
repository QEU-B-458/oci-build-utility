#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
pacman -Syu --noconfirm
grep -v '^#' ./wivrnkit.packages | xargs pacman -Syu --noconfirm
