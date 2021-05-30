alias_paths=(
  "${DOTFILES_DIR}/aliases"
  "${ZDOTDIR}/aliases"
)
for af in ${alias_paths[@]} ; do
  if [ -f "$af" ] ; then
    . "$af"
  fi
done

source $ZSH/oh-my-zsh.sh
