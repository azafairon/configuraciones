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
"set wildmenu     " Enhanced command line completion
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
