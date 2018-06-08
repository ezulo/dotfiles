" Vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" List plugins here
" Different formats:
"   Git:
"     Plugin '[user]/[repo]'
"   Git plugin (not on github):
"     Plugin 'git://path/to/file.git'
"   Git repos on local machine:
"     Plugin 'file:///home/path/to/plugin'
Plugin 'mattn/emmet-vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

syntax on
set number
set relativenumber
set tabstop=4
set backspace=2
set laststatus=2
set t_Co=256

" HTTP
let g:user_emmet_settings = {
\    'indentation' : '  '
\}

" C++

