" Auto-Reload Your Vimrc
augroup reload_vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC
augroup END
