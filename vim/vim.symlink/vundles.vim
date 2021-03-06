" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall

" Filetype off is required by vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle "gmarik/vundle"

" All your bundles here
Bundle "mhinz/vim-signify"
Bundle "skwp/vim-colors-solarized.git"
Bundle "myusuf3/numbers.vim"
Bundle "tomtom/tcomment_vim"
Bundle "scrooloose/nerdtree"
Bundle "jistr/vim-nerdtree-tabs"
Bundle "kien/ctrlp.vim"
Bundle "tpope/vim-surround"
Bundle "Raimondi/delimitMate"
Bundle "itchyny/lightline.vim"
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle "itspriddle/vim-marked"
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'pbrisbin/vim-mkdir'

"Filetype plugin indent on is required by vundle
filetype plugin indent on
