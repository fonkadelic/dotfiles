#!/bin/sh
#
# https://github.com/thoughtbot/dotfiles/blob/master/hooks/post-up#L5-L9

if [ ! -e "$HOME"/.vim/autoload/plug.vim ]; then
  echo "  Installing vim-plug."
  curl -fLo "$HOME"/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "  Installing vim plugins."
vim -u "$HOME"/.vimrc.plugs +PlugInstall +PlugClean! +qa
reset -Q

