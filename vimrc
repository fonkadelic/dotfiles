" Use Vim settings, rather then Vi settings (much better!).
" " This must be first, because it changes other options as a side effect.
set nocompatible 

" =============== Pathogen Initialization ===============
" This loads all the plugins in ~/.vim/bundle
" Use tpope's pathogen plugin to manage all other plugins

runtime bundle/tpope-vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" ================ General Config ====================

set number                          " Line numbers are good
set backspace=indent,eol,start      " Allow backspace in insert mode
set numberwidth=5                   " Width value of the Line number
set encoding=utf-8
set showcmd                         " display incomplete commands
"set showmode                        " Show current mode down the bottom
set ruler                           " Show the cursor position
set laststatus=2                    " Always show the statusline
set cursorline                      " Shows the horizontal cursor line
set gcr=a:blinkon0                  " Disable cursor blink
set visualbell                      " No sounds
set noshowmode                      " Hide current mode (for powerline)

set autoread                        "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" turn on syntax highlighting
syntax on

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" set list listchars=tab:\ \ ,trail:· " Display tabs and trailing spaces visually

set nowrap       " Don't wrap lines
set linebreak    " Wrap lines at convenient points

" ================ Search Settings  =================

set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================== Clipboard ======================

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif


" ================ Key Mappings =====================

" use comma as <Leader> key instead of backslash
let mapleader=","

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Reselect visual block after adjusting indentation
vnoremap < <gv
vnoremap > >gv

" Toggle between absolute and relative line numbers
nnoremap <leader>l :NumbersToggle<CR>

" switch between the currently open buffer and the previous one 
nnoremap <leader><leader> <c-^>

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>


" Include some settings (cleaner .vimrc)
for f in split(glob('~/.vim/plugin/settings/*.vim'), '\n')
  exe 'source' f
endfor
