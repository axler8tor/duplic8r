function docker-list-images
  docker images --format '{{.Repository}}\t{{.Size}}' | column -s\t -t | sort -n -k2
end
