function docker-update
  for image in (docker images --format '{{.Repository}}' | sort)
    if string match --quiet --regex '^axler8tor' $image
      printf "%s\n\n" "Skipping $image..."
    else if string match --quiet --regex '^<none>' $image
      continue
    else
      printf "%s\n\n" "Updating $image..."
      docker pull $image
      echo ""
    end
  end
end
