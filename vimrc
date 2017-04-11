" set encoding
set encoding=utf-8

" set backspace
set backspace=indent,eol,start

" jumps to the last known position in a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" 256 color
set t_Co=256

" mapleader
let mapleader=";"

set wildmenu

" 定义快捷键关闭当前分割窗口
nmap <silent> <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <silent> <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <silent> <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <silent> <Leader>Q :qa!<CR>

" 设置快捷键遍历子窗口
" 依次遍历
nnoremap <silent> <Leader>nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <silent> <Leader>lw <C-W>l
" 跳转至方的窗口
nnoremap <silent> <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <silent> <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <silent> <Leader>jw <C-W>j

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p

" Plugin
set nocompatible              " be iMproved, required
filetype on                  " required
filetype plugin on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" --------------------------------------------------------------------------
" tagbar
" --------------------------------------------------------------------------
Plugin 'majutsushi/tagbar'
nmap <silent> <F3> :TagbarToggle<CR>

" --------------------------------------------------------------------------
" vim-airline
" --------------------------------------------------------------------------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" --------------------------------------------------------------------------
" nerdcommenter
" --------------------------------------------------------------------------
Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
"let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
"let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
"let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
"let g:NERDTrimTrailingWhitespace = 1

" --------------------------------------------------------------------------
" ctrlp
" --------------------------------------------------------------------------
Plugin 'kien/ctrlp.vim'

let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 10
set wildignore+=*_log*,*.a,*.o,*unittest,*functest,*.log,*.class,*.jar,*log_info*
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_working_path_mode = 'ra'

" --------------------------------------------------------------------------
" NERDtree
" --------------------------------------------------------------------------
Plugin 'scrooloose/nerdtree'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <silent> <F4> :NERDTreeToggle<CR>

" --------------------------------------------------------------------------
" easymotion
" --------------------------------------------------------------------------
Plugin 'easymotion/vim-easymotion'

" --------------------------------------------------------------------------
" YouCompleteMe
" --------------------------------------------------------------------------
Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 0 "default 0
let g:ycm_open_loclist_on_ycm_diags = 0 "default 1

let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''
let g:ycm_complete_in_comments=1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_seed_identifiers_with_syntax=1

" 基于语义的代码导航
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>

" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

" --------------------------------------------------------------------------
"  syntastic
" --------------------------------------------------------------------------
Plugin 'vim-syntastic/syntastic'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

map <silent> <F6> :SyntasticCheck<CR>
map <silent> <F7> :SyntasticReset<CR>
map <silent> <F8> :SyntasticToggleMode<CR>

" --------------------------------------------------------------------------
"  auto-pairs
" --------------------------------------------------------------------------
Plugin 'jiangmiao/auto-pairs'

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

" map <F1> key to control change number between relativenumber
function! g:ToggleNuMode()
	if(&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunc

nnoremap <silent> <F1> :call g:ToggleNuMode()<CR>

" search option
set hlsearch
set ignorecase
nnoremap <silent> <F2> :nohls<CR>

" map SHFIT-TAB to :tabnext
map <S-TAB> :tabnext<CR>

" syntax 
syntax on

" map pastetoggle
set pastetoggle=<F5>

" highlight line and column
"set cursorline
"set cursorcolumn

" indent format
set cindent
set autoindent
set smartindent
filetype indent on 

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=2

" fold
"set foldmethod=indent
"set foldmethod=syntax
"set nofoldenable
" colorscheme
" use iterm2 colorscheme
"colorscheme desert

" compile && run
nnoremap <F9> :w <CR> :! g++ % -o %< -std=c++11 -O2 && ./%< <CR>
