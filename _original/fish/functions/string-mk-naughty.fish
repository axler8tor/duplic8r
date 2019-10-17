function string-mk-naughty
  # TODO: check that there can only be numbers passed in for length
  set --local length $argv[1]
  if set --query $length
    set length 21
  end
  cat /dev/urandom | tr --delete --complement '[:punct:][:alnum:][ ]' | head --bytes=$length; echo
end
