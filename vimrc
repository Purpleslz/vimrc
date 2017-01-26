" set encoding
set encoding=utf-8

" set backspace
set backspace=indent,eol,start

" Plugin
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim-airline
Plugin 'vim-airline/vim-airline'
set laststatus=2

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" line number
set number

" search option
set hlsearch
nnoremap <silent> <F2> :nohls<CR>

" map <TAB> to <C-]>
" nnoremap <silent> <TAB> <C-]>

" map F1 to control change number between relativenumber
function! g:ToggleNuMode()
	if(&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunc

nnoremap <silent> <F1> :call g:ToggleNuMode()<CR>

" map SHFIT-TAB to :tabnext
map <S-TAB> :tabnext<CR>
" syntax 
syntax on

" indent format
set cindent
set autoindent
set smartindent

set tabstop=4
set softtabstop=4
set shiftwidth=4

" colorscheme
" use iterm2 color
"colorscheme desert
