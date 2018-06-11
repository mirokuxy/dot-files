#!/usr/bin/env bash

# target config file location
dest_config=~/Library/Application\ Support/Code/User/settings.json
backup_config=${dest_config}.backup
# config file in this repo
source_config=${PWD}/settings.json

echo "Symlinking: ${source_config} -> ${dest_config}"

# backup existing config file
if [ -e "${dest_config}" ]; then
  echo "Existing ${dest_config} found. Backing up -> ${backup_config}"
  mv "${dest_config}" "${backup_config}"
else
  echo "No existing ${dest_config} found"
fi

# create symlink at target location of the config file in this repo
if `ln -s "${source_config}" "${dest_config}"`; then
  echo "Symlinking successful"
else
  echo "Symlinking failed"
fi

