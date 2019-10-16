function mkpasswd --argument-names length
  printf "%s\n" (cat /dev/urandom | tr -dc 'A-Za-z0-9!@#$%^&*:;' | head -c"$length" | sed -e 's/$/\n/')
end
