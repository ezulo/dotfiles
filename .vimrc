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
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'StanAngeloff/php.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'ivalkeen/nerdtree-execute'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()

syntax on
set number
set relativenumber
set shiftwidth=4
set tabstop=4
set backspace=2
set laststatus=2
set t_Co=256

let g:user_emmet_settings = {
\    'indentation' : '  '
\}

" Plaintext
autocmd BufEnter * if &filetype == "" | setlocal ft=text | endif
autocmd Filetype text set autoindent

" Indent
filetype plugin indent on

" NerdTree
let g:NERDTreeQuitOnOpen = 0
noremap <F2> :NERDTree<CR>

" Other mappings
inoremap <c-s> <ESC>:w<CR>
noremap <c-s> :w<CR>
noremap <c-q> :q<CR>
noremap <c-f> :set filetype=
" AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
" Color mappings
highlight colorcolumn ctermbg=black ctermfg=red
highlight type ctermfg=green
highlight comment ctermfg=lightblue
highlight linenr ctermfg=grey
highlight cursorlinenr ctermfg=white
highlight include ctermfg=blue
highlight visual ctermbg=yellow ctermfg=black
highlight statement ctermbg=black ctermfg=white
highlight constant ctermfg=green
highlight conditional ctermfg=blue
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/
