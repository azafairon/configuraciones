" """"""""""""""""""""""""""
" Author : Pablo Ros Garcia
"
" Vundele :Allow us to install plugin for vim
" To set up Vundele, we need to clone the repository and place it in
" .vim/bundle/vundle.
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


"""""""""""""""""""""""""""""""""""""""""""""""""
"  Plugins loaded by Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'gmarik/vundle'

" TAGBAR
" Allow us to get the tags in a file in order to
" indentify functions,classes,procedures.....
Bundle 'majutsushi/tagbar'

"Easy motion
Bundle 'easymotion/vim-easymotion'

" SOLARIZED SCHEMA
" Colors for vim
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'flazz/vim-colorschemes'

" DELIMMATE
" Close { ( ....
Bundle 'Raimondi/delimitMate'
" Bundle 'jiangmiao/auto-pairs'
"Bundle 'tpope/vim-surround'


" NERDTRE
" Generate a directory tree
Bundle "scrooloose/nerdtree"
"Bundle "jistr/vim-nerdtree-tabs"


" CTRL-P
" Search files in a directory given
Bundle "kien/ctrlp.vim"


" VIM-AIRLINE
" Enhance for the status bar
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'


" VIM-COMMENTARY
" Plugin to comment/uncomment
Bundle 'tpope/vim-commentary.git'


" SNIPMATE
" snippet for vim
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

" JSHINT

Bundle 'walm/jshint.vim.git'

" Support for GIT
Bundle 'tpope/vim-fugitive'

"Emmet plugin
"Bundle 'mattn/emmet-vim'

"Python indent
Bundle 'hynek/vim-python-pep8-indent'
"Python autocomple
"Bundle 'davidhalter/jedi-vim'
"Bundle 'ycm-core/YouCompleteMe'
Bundle 'xavierd/clang_complete'


"""""""""""""""""""""""""""""""""""""""""""""""""
" Configure plugins and environment
"""""""""""""""""""""""""""""""""""""""""""""""""

" Configure plugins
" ------------------

" Disable by default openning nerdtree in gui
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:ctrlp_map = '<F4>'
let g:ctrlp_cmd = 'CtrlP'
" To show buffers in the status bar
let g:airline#extensions#tabline#enabled = 1

" Configure environment
" ---------------------

filetype plugin indent on     " required!
" Basic configuration for vim
syntax on
set tabstop=4
set shiftwidth=4
set showmatch
set autoindent
set smartindent
set incsearch
set nocompatible
set ruler
set wildmenu     " Enhanced command line completion
set omnifunc=syntaxcomplete#Complete
set cmdheight=1
set showcmd
set laststatus=2
set so=6
set previewheight=6
set number
set go=t,m
set nobackup
set nowritebackup
set noswapfile
set history=100
set showcmd
set hlsearch
set smartcase
set hidden
filetype indent on
set nofoldenable
set nowrap
set scrolloff=10
set backspace=indent,eol,start
set timeout timeoutlen=1000 ttimeoutlen=100
set encoding=utf-8
set autoread
" Delete space when save the file
"autocmd BufWritePre * :%s/\s\+$//e
" Map the characters to show for space and tabs
" set list listchars=tab:——,trail:⠂
				highlight SpecialKey ctermfg=DarkGray

set relativenumber
set rnu



"""""""""""""""""""""""""""""""""""""""""""""""""
" Make difference between GUI and terminal
"""""""""""""""""""""""""""""""""""""""""""""""""

" Depend if we are running gui or not
if has('gui_running')

	colorscheme molokai

else

	" let g:solarized_termcolors=256
	" let g:solarized_visibility="low"
	" let g:solarized_termtrans=1
	" set t_Co=256
	"set background=dark
	" colorscheme solarized
	"colorscheme Tomorrow-Night-Eighties
	" colorscheme molokai

endif




"""""""""""""""""""""""""""""""""""""""""""""""""
" Some function to enhance vim
"""""""""""""""""""""""""""""""""""""""""""""""""

" Global variables
" ----------------

" Use new parser for SnipMate
let g:snipMate = { 'snippet_version' : 1 }

let s:show_nostandard = 0

hi link over OverLength
hi link whitespace_match WhiteSpace
hi link whitespace_post  WhiteSpace

call matchadd('over','\%81v.\+')
call matchadd('whitespace_match','/[\t]\+[ ]\+[\t]\+\|[ ]\+[\t]\+[ ]\+\|[\t]\+[ ]\+\|[ ]\+[\t]\+\|^[ ]\+\|[\t ]\+$/')
call matchadd('whitespace_post','\s\+$')

" Functions
" ---------

" Show spaces and tabs
function Nostandard()

	hi OverLength ctermbg=red ctermfg=white guibg=#592929
	hi WhiteSpace ctermbg=blue  ctermfg=white guibg=#592929

	if s:show_nostandard
		hi link over NONE
		hi link whitespace_match NONE
		hi link whitespace_post NONE
		let s:show_nostandard = 0
	else
		hi link over OverLength
		hi link whitespace_match WhiteSpace
		hi link whitespace_post  WhiteSpace
		let s:show_nostandard = 1
	endif

endfunction

" Compile java files
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

" Run a file
function Run()

	" We need to save the file before of running the file
	:w

	" We check the type of file to call the proper interpreter

	if &ft == 'tcl'
		!tclsh %
	elseif &ft == 'python'
		!python %
	elseif &ft == 'java'
		:make
		!java -cp %:p:h %:t:r
	elseif &ft == 'javascript'
		!node %
	elseif &ft == 'cpp'
		:make
	else
		echo "Unknown file"
	endif

endfunction

" Toggle quickfix

let s:quickfix_active = 0

function ToogleQuickFix()

	if s:quickfix_active
		:cclose
		let s:quickfix_active = 0
	else
		:copen
		let s:quickfix_active = 1
	endif

endfunction

let s:set_paste = 1

function TooglePaste()

	if s:set_paste
		set paste
		set nolist
		set nonumber
		let s:set_paste = 0
		set norelativenumber
		set nornu
	else
		set nopaste
		set list
		set number
		let s:set_paste = 1
		set relativenumber
		set rnu
	endif

endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping keys
"""""""""""""""""""""""""""""""""""""""""""""""""

nmap <silent> <C-t> :tabnew<cr>
nmap <silent> <C-left> :bp<cr>
nmap <silent> <C-right> :bn<cr>
nmap <silent> <C-l> :bn<cr>
nmap <silent> <C-h> :bp<cr>
map <silent> <F2> :TagbarToggle<cr>
map <silent> <F3> :NERDTreeToggle<cr>
map <silent> <F5> :call TooglePaste()<cr>
map <silent> <F6> :call ToogleQuickFix()<cr>
vmap <silent> <C-v> "+gP<cr>
vmap <silent> <C-c> "+y<cr>
vmap <silent> <C-x> "+x<cr>
nmap <silent> <A-left> :wincmd h<cr>
nmap <silent> <A-right> :wincmd l<cr>
nmap <silent> <A-up> :wincmd k<cr>
nmap <silent> <A-down> :wincmd j<cr>
nmap <silent> <A-h> :wincmd h<cr>
nmap <silent> <A-l> :wincmd l<cr>
nmap <silent> <A-k> :wincmd k<cr>
nmap <silent> <A-j> :wincmd j<cr>
map <silent> <F9> :call Nostandard()<cr>
map <silent> <F8> :call Run()<cr>
nnoremap gr :grep -R '\b<cword>\b' *<CR>
" Use jj to escape insert mode. Potential for collision? Actually pretty low.
inoremap jj <ESC>
" If always we are working with buffers maybe it is nice use bd instead of q
" :cnoreabbrev wq w<bar>bd
" :cnoreabbrev q bd

