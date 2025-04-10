#!/bin/sh

for file in $(find ./dotfiles -type f | sed 's/\.\/dotfiles\///g'); do
    # skip README.md
    if test "${file}" = "README.md"; then
        continue
    fi
    codium --diff "${HOME}/${file}" "dotfiles/${file}"
done
