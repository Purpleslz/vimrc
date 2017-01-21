set encoding=utf-8

set number

function! g:ToggleNuMode()
	if(&relativenumber == 1)
		set number
	else
		set relativenumber
	endif
endfunc

nnoremap <silent> <F1> :call g:ToggleNuMode()<CR>

syntax on

set smartindent

set tabstop=4
set softtabstop=4
set shiftwidth=4

colorscheme desert
