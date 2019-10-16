function system-watch-iowait
  watch -n 1 "(ps -ef | awk '\$8 ~ /D/ {print \$0}')"
end
