#!/bin/bash

ACTION="${1}"
DOTFILES_DIR="${2:-$PWD}"

declare -A DOTFILES_MAP
DOTFILES_MAP["bash/login"]=".bash_login"
DOTFILES_MAP["bash/logout"]=".bash_logout"
DOTFILES_MAP["bash/rc"]=".bash_rc"
DOTFILES_MAP["tmux"]=".tmux"
DOTFILES_MAP["tmux.conf"]=".tmux.conf"
DOTFILES_MAP["vim"]=".vim"
DOTFILES_MAP["vimrc"]=".vimrc"

if [[ ! "$ACTION" =~ ^(install|uninstall)$ ]] ; then
    echo "Invalid action: $ACTION"
    echo "Usage: $0 (install|uninstall) [<dotfile-dir>]"
    exit 1
fi

function link() {
    src_file="${DOTFILES_DIR}/$1"
    dst_file="${HOME}/$2"
    if [ -e "$src_file" -a ! -e "$dst_file" ] ; then
        ln -s "$src_file" "$dst_file"
        return $?
    fi
    return 1
}

function unlink() {
    dst_file="${HOME}/$1"
    if [ -e "$dst_file" ] ; then
	rm "$dst_file"
        return $?
    fi
    return 1
}

for dfile in "${!DOTFILES_MAP[@]}" ; do
    if [[ "$ACTION" -eq "install" ]] ; then
        link "$dfile" "${DOTFILES_MAP[$dfile]}"
    elif [[ "$ACTION" -eq "uninstall" ]] ; then
        unlink "${DOTFILES_MAP[$dfile]}"
    fi
done
