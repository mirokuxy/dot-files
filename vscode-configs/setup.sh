#!/usr/bin/env bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${script_dir}

source ../utils.sh

echo "Placing vscode config file"

dest_config=~/Library/Application\ Support/Code/User/settings.json # target config file location
backup_config="${dest_config}.backup"
source_config="${script_dir}/settings.json" # config file in this repo

place_symlink "$dest_config" "$backup_config" "$source_config"

echo "Done"
