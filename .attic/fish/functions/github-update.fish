function github-update
  for dir in (ls)
    printf "$dir\n\n"
    pushd $dir
    git pull
    printf "\n\n"
    popd
  end
end
