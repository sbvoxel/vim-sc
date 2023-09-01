#!/bin/bash

# Define source and destination directories
src_dir=$(pwd)
dst_dir="$HOME/.config/nvim"

# List of vim config subdirectories to copy
sub_dirs=("autoload" "ftdetect" "ftplugin" "plugin" "syntax")

# Copy files
for dir in "${sub_dirs[@]}"; do
  mkdir -p "$dst_dir/$dir"
  cp -r "$src_dir/$dir/"* "$dst_dir/$dir/"
done
