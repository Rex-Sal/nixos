#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash

#source ${zshExtensionsDir}/zsh-vim-mode.plugin.zsh
if [ -n "${commands[fzf-share]}" ]; then
    source "$(fzf-share)/key-bindings.zsh"
    source "$(fzf-share)/completion.zsh"
fi
