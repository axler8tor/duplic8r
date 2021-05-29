function timestamp --argument-names type --description='Display a timestamp in iso8601, second or nano second format.'
  switch $type
    case 'iso' 'iso8601'
      date +%Y-%m-%dT%H:%M:%S
    case 'n' 'nano'
      date +%Y%m%d%H%M%S%N
    case '*'
      date +%Y%m%d%H%M%S
  end
end
