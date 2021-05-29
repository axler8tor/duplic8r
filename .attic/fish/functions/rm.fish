function rm
  printf "%s\n" "The following files will be deleted:"
  ls -C --group-directories-first $argv

  set_color red -o
  echo "This operation cannot be undone!"
  set_color normal

  if confirm
    command rm --force --recursive --verbose $argv
  else
    echo "Cancelled"
  end
end
