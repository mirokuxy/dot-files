#!/usr/bin/env bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${script_dir}

source ../utils.sh

dest_folder=~
backup_folder=~/dot-files-backup
source_folder=${script_dir}

# Check backup folder
if [ ! -d "${backup_folder}" ]; then
  echo "Backup folder not found. Creating ..."
  mkdir "${backup_folder}"
fi

# Place symlinks for files

echo "Symlinking dot files"

files=`ls -ap -- . | grep -v / | grep "^\."`

for file in $files; do
  dest_file="${dest_folder}/${file}"
  backup_file="${backup_folder}/${file}"
  source_file="${source_folder}/${file}"

  place_symlink "$dest_file" "$backup_file" "$source_file"
done

echo "Symlinking done"
