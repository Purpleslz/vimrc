" set encoding
set encoding=utf-8

" line number
set number

" search option
set hlsearch
nnoremap <silent> <F2> :nohls<CR>

" map F1 to control change number between relativenumber
function! g:ToggleNuMode()
	if(&relativenumber == 1)
		set number
	else
		set relativenumber
	endif
endfunc

nnoremap <silent> <F1> :call g:ToggleNuMode()<CR>

" syntax 
syntax on

" indent format
set smartindent

set tabstop=4
set softtabstop=4
set shiftwidth=4

" colorscheme
" use iterm2 color
" colorscheme desert
