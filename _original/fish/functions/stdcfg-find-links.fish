function stdcfg-find-links
  for link in (find ~ -type l ^/dev/null)
    ls -Gg1 "$link"
  end | grep "stdcfg" --color=never | sed -e 's/^l[A-Za-z0-9: ]* //'
end
