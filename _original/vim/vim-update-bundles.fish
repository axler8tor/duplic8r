function update-bundles
    set repositories (ls -d */ | sed -e 's/\/\/$/\//')
    for repository in $repositories
        pushd $repository
        echo
        echo (pwd)
        echo
        set branch (git branch | sed -e 's/^\* //')
        git pull origin $branch
        popd
    end
end

