hi! link SignColumn Background

hi! SignifySignAdd    guifg=#009900 guibg=NONE ctermfg=2 ctermbg=NONE
hi! SignifySignChange guifg=#bbbb00 guibg=NONE ctermfg=3 ctermbg=NONE
hi! SignifySignDelete guifg=#ff2222 guibg=NONE ctermfg=1 ctermbg=NONE

" Disable line highlighting
hi! CursorLine guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE

hi! LineNR        guifg=#898989 guibg=#393939 ctermfg=245 ctermbg=237
hi! CursorLineNr  guifg=#C1C1C1 guibg=#515151 ctermfg=251 ctermbg=239

" Enforce the colors set here
au VimEnter * so ~/.vim/settings/tomorrow.vim
