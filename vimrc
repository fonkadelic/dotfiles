" Use Vim settings, rather then Vi settings (much better!).
" " This must be first, because it changes other options as a side effect.
set nocompatible 

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

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundle.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

" Include some settings (cleaner .vimrc)
for f in split(glob('~/.vim/plugin/settings/*.vim'), '\n')
   exe 'source' f
endfor
