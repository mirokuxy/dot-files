function place_symlink {
  dest_file="$1"
  backup_file="$2"
  source_file="$3"

  echo "Symlinking ${source_file} -> ${dest_file} ..."

  # backup existing file
  if [ -e "${dest_file}" ] || [ -L "${dest_file}" ]; then
    echo "Existing ${dest_file} found. Backing up -> ${backup_file}"
    mv "${dest_file}" "${backup_file}"
  fi

  # create symlink at target location of the source file
  if ! `ln -s "${source_file}" "${dest_file}"`; then
    echo "Warn: Symlinking failed"
  fi
}
