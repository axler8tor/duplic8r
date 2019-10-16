function docker-get-ip
  set container $argv[1]
  sudo docker inspect --format='{{ .NetworkSettings.IPAddress }}' $container
end
