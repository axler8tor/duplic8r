function confirm
  while true
    read --local --prompt=confirm_prompt confirm_
    switch $confirm_
      case '' N n
        return 1
      case Y y
        return 0
    end
  end
end

function confirm_prompt
  echo 'Continue? [y/N] '
end
