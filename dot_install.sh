#!/bin/bash
set -euo pipefail

SKIP_FILES=(".git" ".gitignore" ".gitmodules")

function link_file {
    local source="${PWD}/$1"
    local target="${HOME}/$1"

    if [ -f "${target}" ]; then
        cp "${target}"{,".$(date +%F).bak"}
    fi

    echo "Linking ${source} -> ${target}"
    ln -sf "${source}" "${target}"
}

if [ -d ~/.dotfiles ]; then
    pushd ~/.dotfiles/
    git pull origin master
    popd
else
    git clone https://github.com/stamak/dotfiles.git ~/.dotfiles
fi

pushd ~/.dotfiles/
for file in .[a-zA-Z]*; do
    skip=false
    for s in "${SKIP_FILES[@]}"; do
        if [ "$file" == "$s" ]; then
            skip=true
            break
        fi
    done
    if [ "$skip" == "true" ]; then
        continue
    fi
    link_file "$file"
done
popd
