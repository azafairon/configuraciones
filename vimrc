" Configuracion para hacer funcionar Vundle
" Vundele : instalar plugin para vim de forma sencilla

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Para gestionar los Bundles, necesario clonar el repositorio
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
Bundle 'gmarik/vundle'

" Plugin ver las funciones,clases del fichero
Bundle 'majutsushi/tagbar'
" Plugins para colores
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/molokai'
" automaticamente cierra llaves y tags
Bundle 'Raimondi/delimitMate'
" interesante plugin para ver los numeros
" relativos a la linea en la que estas
" si quieres borrar 3 lineas ya no tendre
" que contar nunca mas....
Bundle "myusuf3/numbers.vim"
"visualizar directorio
Bundle "scrooloose/nerdtree"
Bundle "jistr/vim-nerdtree-tabs"
" Plugin para buscar ficheros con expresiones regulares
Bundle 'L9'
Bundle 'FuzzyFinder'


" Status line mejorada
Bundle 'bling/vim-airline'
" Para mostrar los buffes y tabs en el top
let g:airline#extensions#tabline#enabled = 1

" Plugin para comentar y descomentar
Bundle 'tpope/vim-commentary.git'

" Para facil uso the html objetos
Bundle 'rstacruz/sparkup'

" para moverse facilmente y editar

Bundle 'Lokaltog/vim-easymotion'

" Snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
" plugin para usar cvs/git/svn....etc
" Peligroso activarlo si saber como se maneja
" del todo...por ahora lo desactivo

"Bundle 'vim-scripts/vcscommand.vim'

filetype plugin indent on     " required!

" Ahora empezamos con configuraciones basicas
" Color molokai --> no fuciona en terminal, solo
" para gvim.......buscar otro scheme ??

colorscheme molokai
" si cambiamos a 256 colores funciona el scheme
set t_Co=256

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
set mouse=a
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
" Borra whitespace al grabar
autocmd BufWritePre * :%s/\s\+$//e

" lista de caracteres para ver los espacios y los tabs
set list listchars=tab:——,trail:⠂
				highlight SpecialKey ctermfg=DarkGray

" Mapeamos algunas teclas para las tabs

nmap <silent> <C-t> :tabnew<cr>
nmap <silent> <C-left> :tabprev<cr>
nmap <silent> <C-right> :tabnext<cr>

nmap <silent> <C-l> :tabprev<cr>
nmap <silent> <C-h> :tabnext<cr>

" Mapeamos el tagbartoggle para las funciones

map <silent> <F2> :TagbarToggle<cr>
map <silent> <F3> :NERDTreeTabsToggle<cr>
map <silent> <F4> :FufCoverageFile<cr>
map <silent> <F5> :set cursorline!<cr>:set cursorcolumn!<cr>
map <silent> <F6> :set list!<cr>
map <silent> <F7> :tab sball<cr>

" La idea es mapear los siguientes comandos
" "+gP pega el texto desde el porta papeles
" "+gY copia el texto desde el portapapeles
" "+gX corta el texto desde el portapapeles
vmap <silent> <C-v> "+gP<cr>
vmap <silent> <C-c> "+y<cr>
vmap <silent> <C-x> "+x<cr>

" ahora vamos a movernos por las ventanas facilmente
" en el terminal no funciona el mapeo, truco

nmap <silent> <A-left> :wincmd h<cr>
nmap <silent> <A-right> :wincmd l<cr>
nmap <silent> <A-up> :wincmd k<cr>
nmap <silent> <A-down> :wincmd j<cr>

nmap <silent> <A-h> :wincmd h<cr>
nmap <silent> <A-l> :wincmd l<cr>
nmap <silent> <A-k> :wincmd k<cr>
nmap <silent> <A-j> :wincmd j<cr>

" Funciones de estilo, muestra lo que
" no es aceptable para el standard
let s:show_nostandard = 0

function Nostandard()

	hi OverLength ctermbg=red ctermfg=white guibg=#592929
	hi WhiteSpace ctermbg=blue  ctermfg=white guibg=#592929
	hi link over OverLength
	hi link space WhiteSpace
	match over  /\%81v.\+/
	" todo : ver la funcion que tienen en el trabajo
	" para los espacios, sustituirla por esta
	2match space /\s\+$/

	if s:show_nostandard
		hi link over NONE
		hi link space NONE
		let s:show_nostandard = 0
	else
		hi link over OverLength
		hi link space WhiteSpace
		let s:show_nostandard = 1
	endif

endfunction


function ShowHelp()

	echo "<F2>: mostrar tags en el fichero"
	echo "<F3>: mostrar arbol de directorio"
	echo "<F4>: buscar ficheros expresiones regulares"
	echo "<F5>: toggle lineas para el cursor "
	echo "<F6>: toggle mostrar espacios y tabs"
	echo "<F7>: pasar buffers a tabs"
	echo "<F8>: ejecutamos interprete para el fichero, grabamos antes"
	echo "<F9>: toggle resaltado los standars, >80 lineas y trail espacios"
	echo "<F10> mostrar esta ayuda"
	echo "<Ctrl-t>: nueva tab"
	echo "<Ctrl-direccion>: mover entre tabs"
	echo "<Alt-direccion>: moverse entre ventanas"

endfunction

function Ejecutar()

	" grabamos el fichero
	:w

	" dependiendo del tipo ejecutamos
	" un interprete u otro

	if &ft == 'tcl'
		!tclsh %
	elseif &ft == 'python'
		!python %
	else
		echo "ni idea del fichero"
	endif

endfunction



" mapeos para las funciones

map <silent> <F9> :call Nostandard()<cr>
map <silent> <F10> :call ShowHelp()<cr>
map <silent> <F8> :call Ejecutar()<cr>


let g:nerdtree_tabs_open_on_gui_startup = 0
