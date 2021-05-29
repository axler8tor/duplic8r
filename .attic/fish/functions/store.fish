function store
  set source (echo $argv[1] | sed -e 's/\/$//')
  set target (echo $argv[2] | sed -e 's/\/$//')
  zip -r -0 "$target/$source.zip" "$source"
end
