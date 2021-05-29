function docker-run
  if test (count $argv) -lt 2
    docker run --interactive --tty --name "$argv[1]".(timestamp *) $argv[1]
  else
    docker run --interactive --tty --name "$argv[1]".(timestamp *) $argv[1] $argv[2]
  end
end
