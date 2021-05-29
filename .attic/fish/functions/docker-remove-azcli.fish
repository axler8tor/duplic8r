function docker-remove-azcli          \
  --argument-names cli_               \
  --description 'Remove an Azure CLI' \

  rm ~/.az/"$cli_"
end
