" Make it beautiful - colors and fonts

"colorscheme Tomorrow-Night-Eighties
"set background=dark

if has("gui_running")
  "tell the term has 256 colors
  "set t_Co=256

  " set font
  "set guifont=Source\ Code\ Pro:h15,Menlo:h15
  "set antialias

  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  "autocmd VimEnter * set guitablabel=%N:\ %t\ %M

endif
