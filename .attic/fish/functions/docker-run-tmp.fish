function docker-run-tmp
  set --local image (printf "%s" $argv[1] | sed -e 's/\//./g' | sed -e 's/:/-t-/g')
  if test (count $argv) -lt 2
    docker run --interactive --tty --name "$image".(timestamp *) --rm $argv[1]
  else
    docker run --interactive --tty --name "$image".(timestamp *) --rm $image $argv[2]
  end
end
