function apt-switch-bz2gz
  sudo apt-get update -o Acquire::CompressionTypes::Order::=gz
end
