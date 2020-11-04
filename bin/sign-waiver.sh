#!/bin/sh

repo() {
    repo=$(git remote -v | head -1 | sed -e 's/^origin\s*//' | sed -e 's/ (f.*$//')
}

timestamp() {
    timestamp=$(date +'%y-%m-%d %H:%M')
}

signature() {
    signature=$(gpg --output - --detach-sign --armor ../WAIVER)
}


repo
timestamp
signature

# echo ${github_user}
# echo ${timestamp}
# echo ${waiver}

echo "## ${repo} ##\n**${timestamp}**\n${signature}\n" >> ../CONTRIBUTORS.md
