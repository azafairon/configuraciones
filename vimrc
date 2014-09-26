" Configuracion para hacer funcionar Vundle
" Vundele : instalar plugin para vim de forma sencilla

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Para gestionar los "Bundles, necesario clonar el repositorio
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
Bundle 'gmarik/vundle'

" Plugin ver las funciones,clases del fichero
Bundle 'majutsushi/tagbar'
" Plugins para colores
Bundle 'altercation/vim-colors-solarized'
colorscheme solarized

if has('gui_running')

	set background=light

else

	let g:solarized_termcolors=256
	let g:solarized_visibility="low"
	"let g:solarized_termtrans=1
	set t_Co=256
	set background=dark

endif

""Bundle 'vim-scripts/molokai'
" automaticamente cierra llaves y tags
Bundle 'Raimondi/delimitMate'
" interesante plugin para ver los numeros
" relativos a la linea en la que estas
" si quieres borrar 3 lineas ya no tendre
" que contar nunca mas....
""Bundle "myusuf3/numbers.vim"
"visualizar directorio
Bundle "scrooloose/nerdtree"
Bundle "jistr/vim-nerdtree-tabs"
" Plugin para buscar ficheros con expresiones regulares
""Bundle 'L9'
""Bundle 'FuzzyFinder'
Bundle "kien/ctrlp.vim"
let g:ctrlp_map = '<F4>'
let g:ctrlp_cmd = 'CtrlP'


" Status line mejorada
Bundle 'bling/vim-airline'
" Para mostrar los buffes y tabs en el top
let g:airline#extensions#tabline#enabled = 1

" Plugin para comentar y descomentar
Bundle 'tpope/vim-commentary.git'

" Para facil uso the html objetos
""Bundle 'rstacruz/sparkup'

" para moverse facilmente y editar

""Bundle 'Lokaltog/vim-easymotion'

" para autocompletado
" Bundle 'Valloric/YouCompleteMe'
"let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_autoclose_preview_window_after_completion = 1
"set completeopt-=preview

" Snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
" plugin para usar cvs/git/svn....etc
" Peligroso activarlo si saber como se maneja
" del todo...por ahora lo desactivo

""Bundle 'vim-scripts/vcscommand.vim'

filetype plugin indent on     " required!

" Ahora empezamos con configuraciones basicas
" Color molokai --> no fuciona en terminal, solo
" para gvim.......buscar otro scheme ??

"colorscheme molokai

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
" Borra whitespace al grabar
autocmd BufWritePre * :%s/\s\+$//e

" lista de caracteres para ver los espacios y los tabs
set list listchars=tab:——,trail:⠂
				highlight SpecialKey ctermfg=DarkGray

" Mapeamos algunas teclas para las tabs

nmap <silent> <C-t> :tabnew<cr>
nmap <silent> <C-left> :tabprev<cr>
nmap <silent> <C-right> :tabnext<cr>

nmap <silent> <C-l> :bp<cr>
nmap <silent> <C-h> :bn<cr>

" Mapeamos el tagbartoggle para las funciones

map <silent> <F2> :TagbarToggle<cr>
map <silent> <F3> :NERDTreeTabsToggle<cr>
"map <silent> <F4> :FufCoverageFile<cr>
"map <silent> <F5> :set cursorline!<cr>:set cursorcolumn!<cr>
" me parece mas interesante mapear aqui el toggle the numbers
" mas que las lineas que no suelo utilizar
map <silent> <F5> :set number!<cr>
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


hi link over OverLength
hi link whitespace_post WhiteSpace
hi link whitespace_pre WhiteSpace

" # Find lines with invalid whitespace.  They are considered incorrect if:
" #   1) If the line ends with a whitespace character. This covers the case where a line is entirely whitespace.
" #   2) If any whitespace characters except tabs precede the first non-whitespace character
" #   3) If any whitespace characters except spaces follow the first non-whitespace character
" export GREP_OPTIONS="-Hn"

" result1=$(grep -P '\s$' $1)
" result2=$(grep -vP $'^\t*(?:\S| \*|$)' $1)
" result3=$(grep -P '\S[^\S ]' $1)


call matchadd('over','\%81v.\+')
call matchadd('whitespace_post','\s\+$')
call matchadd('whitespace_pre','^[^\t]\s\+\S')
"call matchadd('whitespace_pre','$^\t*(?:\S| \*|$)')
"call matchadd('whitespace_inter','$^\t*(?:\S| \*|$)')

function Nostandard()

	hi OverLength ctermbg=red ctermfg=white guibg=#592929
	hi WhiteSpace ctermbg=blue  ctermfg=white guibg=#592929

	if s:show_nostandard
		hi link over NONE
		hi link whitespace_post NONE
		hi link whitespace_pre NONE
		let s:show_nostandard = 0
	else
		hi link over OverLength
		hi link whitespace_post WhiteSpace
		hi link whitespace_pre WhiteSpace
		let s:show_nostandard = 1
	endif

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
map <silent> <F8> :call Ejecutar()<cr>


let g:nerdtree_tabs_open_on_gui_startup = 0
