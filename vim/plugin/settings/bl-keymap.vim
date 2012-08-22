" This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

if has("gui_macvim")

  " bind command-] to shift right
  nmap <D-]> >>
  vmap <D-]> >>
  imap <D-]> <C-O>>>

  " bind command-[ to shift left
  nmap <D-[> <<
  vmap <D-[> <<
  imap <D-[> <C-O><<

  " Make selection with the shift key work as in any Mac app
  " let macvim_skip_hig_shift_movement = 1

  " more TextMate/Mac like command mappings
  map <D-/> ,c<Space>

end
