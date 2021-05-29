function docker-clean
  set --local processes (docker ps --all --quiet)
  if test (count $processes) -gt 0
    docker rm $processes
  end

  set --local nones (docker images | grep "<none>" | awk '{print $3}')
  if test (count $nones) -gt 0
    docker rmi --force $nones
  else
    printf "%s\n" "No images to remove..."
  end
end
