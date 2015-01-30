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


" SOLARIZED SCHEMA
" Colors for vim
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'

" DELIMMATE
" Close { ( ....
"Bundle 'Raimondi/delimitMate'
Bundle 'jiangmiao/auto-pairs'


" NERDTRE
" Generate a directory tree
Bundle "scrooloose/nerdtree"
Bundle "jistr/vim-nerdtree-tabs"


" CTRL-P
" Search files in a directory given
Bundle "kien/ctrlp.vim"


" VIM-AIRLINE
" Enhance for the status bar
Bundle 'bling/vim-airline'


" VIM-COMMENTARY
" Plugin to comment/uncomment
Bundle 'tpope/vim-commentary.git'


" SNIPMATE
" snippet for vim
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'




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
autocmd BufWritePre * :%s/\s\+$//e
" Map the characters to show for space and tabs
set list listchars=tab:——,trail:⠂
				highlight SpecialKey ctermfg=DarkGray



"""""""""""""""""""""""""""""""""""""""""""""""""
" Make difference between GUI and terminal
"""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme solarized

" Depend if we are running gui or not
if has('gui_running')

	colorscheme molokai

else

	let g:solarized_termcolors=256
	let g:solarized_visibility="low"
	let g:solarized_termtrans=1
	set t_Co=256
	set background=dark

endif




"""""""""""""""""""""""""""""""""""""""""""""""""
" Some function to enhance vim
"""""""""""""""""""""""""""""""""""""""""""""""""

" Global variables
" ----------------

let s:show_nostandard = 0

hi link over OverLength
hi link whitespace_post WhiteSpace
hi link whitespace_pre WhiteSpace

call matchadd('over','\%81v.\+')
call matchadd('whitespace_post','/[\t]\+[ ]\+[\t]\+\|[ ]\+[\t]\+[ ]\+\|[\t]\+[ ]\+\|[ ]\+[\t]\+\|^[ ]\+\|[\t ]\+$/')
"call matchadd('whitespace_post','\s\+$')
"call matchadd('whitespace_pre','^[^\t]\s\+\S')


" Functions
" ---------

" Show spaces and tabs
function Nostandard()

	hi OverLength ctermbg=red ctermfg=white guibg=#592929
	hi WhiteSpace ctermbg=blue  ctermfg=white guibg=#592929

	if s:show_nostandard
		hi link over NONE
		hi link whitespace_post NONE
"		hi link whitespace_pre NONE
		let s:show_nostandard = 0
	else
		hi link over OverLength
		hi link whitespace_post WhiteSpace
"		hi link whitespace_pre WhiteSpace
		let s:show_nostandard = 1
	endif

endfunction

" Run a file
function Run()

	" We need to save the file before of running the file
	:w

	" We check the type of file to call the proper interpreter

	if &ft == 'tcl'
		!tclsh %
	elseif &ft == 'python'
		!python %
	else
		echo "Unknown file"
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
map <silent> <F3> :NERDTreeTabsToggle<cr>
map <silent> <F5> :set number!<cr>
map <silent> <F6> :set list!<cr>
map <silent> <F7> :tab sball<cr>
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
" Use jj to escape insert mode. Potential for collision? Actually pretty low.
inoremap jj <ESC>

