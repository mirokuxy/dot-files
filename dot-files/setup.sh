#!/usr/bin/env bash

function place_symlink {
  dest_file=$1
  backup_file=$2
  source_file=$3

  echo "Symlinking ${source_file} -> ${dest_file} ..."

  # backup existing file
  if [ -e "${dest_file}" ]; then
    echo "Existing ${dest_file} found. Backing up -> ${backup_file}"
    mv "${dest_file}" "${backup_file}"
  fi

  # create symlink at target location of the source file
  if ! `ln -s "${source_file}" "${dest_file}"`; then
    echo "Warn: Symlinking failed"
  fi
}

dest_folder=~
backup_folder=~/dot-files-backup
source_folder=${PWD}

files=`ls -ap | grep -v / | grep "^\."`

echo "Symlinking dot files"

# Check backup folder
if [ ! -d "${backup_folder}" ]; then
  echo "Backup folder not found. Creating ..."
  mkdir "${backup_folder}"
fi

# Place symlinks for each file
for file in $files; do
  dest_file="${dest_folder}/${file}"
  backup_file="${backup_folder}/${file}"
  source_file="${source_folder}/${file}"

  place_symlink $dest_file $backup_file $source_file
done

