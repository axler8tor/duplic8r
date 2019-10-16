function docker-list-azcli
  echo (l1 "$HOME/.az") | sed -e 's/\///g'
end
