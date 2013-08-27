if !has("gui_macvim")
  set t_Co=256
  let g:solarized_termcolors=256
endif

hi! link SignColumn Background

hi! SignifySignAdd    guifg=#009900 guibg=NONE ctermfg=2 ctermbg=NONE
hi! SignifySignChange guifg=#bbbb00 guibg=NONE ctermfg=3 ctermbg=NONE
hi! SignifySignDelete guifg=#ff2222 guibg=NONE ctermfg=1 ctermbg=NONE

" Enforce the colors set here
au VimEnter * so ~/.vim/plugin/settings/vim-colors-solarized.vim

