#/bin/bash

DOTFILES_DIR="${1:-${HOME}/.dotfiles}"
ZSHENV_FILE="${HOME}/.zshenv"

if [ ! -d "$DOTFILES_DIR" ] ; then
  echo "ERROR: ZSH does not exist in the dotfiles dir, path=${DOTFILES_DIR}"
  exit 1
fi

if [ -f "$ZSHENV_FILE" ] ; then
  move "$ZSHENV_FILE"
fi

cat - >"$ZSHENV_FILE" <<EOF
DOTFILES_DIR="${DOTFILES_DIR}"
ZDOTDIR="\${DOTFILES_DIR}/zsh"
source "\${ZDOTDIR}/.zshenv"
EOF

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
