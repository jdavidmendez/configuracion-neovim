set title "muestra el nombre del archivo en la ventana de la terminal
set number "muestra los numeros de las lineas
set mouse=a "permite la integracion del mouse
set cursorline "resalta la linea actual
"set colorcolumn=120 "muestra la columna limite a 120 caracteres
set numberwidth=1
set clipboard=unnamedplus
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
"set noshowmode "permite ocultar el texto que indica el modo
set termguicolors  " Activa true colors en la terminal
set updatetime=250 " actualiza la barra lateral cada 250 milisegundos
call plug#begin('~/.vim/plugged')

" temas
Plug 'morhetz/gruvbox'

"IDE
Plug 'easymotion/vim-easymotion'
"Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

Plug 'vim-airline/vim-airline' "barra de estado con intregracion varios pluggins
Plug 'vim-airline/vim-airline-themes'  " Temas para airline

Plug 'Yggdroot/indentLine' " muestra lineas verticales en espaciados

"AUTO COMPLETADO COC
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

"motor analizador de codigo
Plug 'w0rp/ale'

"resaltado de sintaxis
Plug 'sheerun/vim-polyglot'

"inserta pares comillas,parentesis...
Plug 'jiangmiao/auto-pairs'

"navegación con tabular (para auto completar)
Plug 'ervandew/supertab'

"Busqueda incremental mejorada
Plug 'haya14busa/incsearch.vim'

" comentarios Facilita agregar y quitar comentarios.
Plug 'scrooloose/nerdcommenter'

" muestra cambios en el archivo en la columna de signos
Plug 'airblade/vim-gitgutter'

" clipboard compartido
Plug 'christoomey/vim-system-copy'

"Emmet
Plug 'mattn/emmet-vim'

" resaltado de pares tags
Plug 'valloric/matchtagalways'

"AUTOCOMPLETADO html5
Plug 'othree/html5.vim'

"autoclosetag
Plug 'alvan/vim-closetag'

"auto guardar :AutoSaveToggle:AutoSaveToggle
Plug '907th/vim-auto-save'

"permite visibilizar pestañas de buffers
Plug 'pacha/vem-tabline'

"permite visualizar iconos  en la pestaña de acuerdo al tipo de archivo
Plug 'ryanoasis/vim-devicons'

"Formateador
Plug 'Chiel92/vim-autoformat'

" React code snippets
Plug 'mlaursen/vim-react-snippets'

" Ultisnips React
Plug 'SirVer/ultisnips'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

call plug#end()

"**** TEMA INSTALADO
colorscheme gruvbox
let g:gruvbox_contrast_dark

"**** CONFIGURACION DE BARRA NAVEGACIÓN ARCHIVOS
"let NERDTreeQuitOnOpen=1
"let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual

"**** CONFIGURACION DE AIRLINE (REEMPLAZA LA BARRA INFERIOR CON NUEVO DISEÑO)
let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1

"**** CONFIGURACION DE BARRAS VERTICALES
" No mostrar en ciertos tipos de buffers y archivos [lineas verticales]
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']

"CONFIGURACION DE AUTOCOMPLETADO COC
autocmd FileType python let b:coc_suggest_disable = 1
autocmd FileType javascript let b:coc_suggest_disable = 1
autocmd FileType scss setl iskeyword+=@-@
imap <C-t> <Plug>(coc-snippets-expand)
nnoremap <space>e :CocCommand explorer<CR>

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json',
  \ 'coc-angular',
  \ 'coc-explorer',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-html-css-support',
  \ 'coc-cssmodules',
  \ 'coc-scssmodules',
  \ 'coc-htmlhint',
  \ 'coc-tabnine',
  \ 'coc-thrift-syntax-support',
  \ 'coc-git',
  \ 'coc-emmet',
  \ 'coc-vimlsp',
  \ 'coc-yank'
  \ ]

"CONFIGURACION SUPERTAB
" Invertir direccion de navegacion (de arriba a abajo)
let g:SuperTabDefaultCompletionType = '<c-n>'


"**** CONFIGURACION MOTOR ANALIZADOR DE CODIGO
" Mostrar mejor mensajes de error
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


"**** CONFIGURACION KITE
" todos los lenguajes que soporta Kite
" let g:kite_supported_languages = ['*']
"para que kite solo autocomplete en los siguientes lenguajes
"let g:kite_supported_languages = ['python', 'javascript', 'go']


"****CONFIGURACION BUSQUEDA INCRMENTAL
" Quitar resaltado luego de buscar
let g:incsearch#auto_nohlsearch = 1

"**** CONFIGURACIONES NERDCOMMENTER
let g:NERDSpaceDelims = 1  " Agregar un espacio después del delimitador del comentario
let g:NERDTrimTrailingWhitespace = 1  " Quitar espacios al quitar comentario

" ****CONFIGURACIONES DE COMANDOS****

"indica cual es la tecla lider
let mapleader=" "

" CONFIGURACION EASYMOTION 
nmap <Leader>s <Plug>(easymotion-s2)


"CHORTCUT PARA GUARDAR Y SALIR
nmap <Leader>w :w<CR> "genera un chortcut para guardar usando espacio y la letra
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>

" comandos de COC
nmap <silent> gd <Plug>(coc-definition)
nma <silent> gy <Plug>(coc-type-definition)
nma <silent> gi <Plug>(coc-implementation)
nma <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

if &filetype == "javascript" || &filetype == "python"
  inoremap <c-space> <C-x><C-u>
else
  inoremap <silent><expr> <c-space> coc#refresh()
endif

" Autocompletar elemento seleccionado de la lista

if exists('*complete_info')
  inoremap <silent><expr> <cr> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif

"COMANDOS BUSQUEDA INCREMENTAL
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)


"CONFIGURACION VEM TABLINE
"muestra las pestañas desde la primera abiera
let g:vem_tabline_show = 2
"mueve entre pestañas
nmap <leader>h <Plug>vem_move_buffer_left-
nmap <leader>l <Plug>vem_move_buffer_right-
nmap <leader>p <Plug>vem_prev_buffer-
nmap <leader>n <Plug>vem_next_buffer-
nmap <leader>x <Plug>vem_delete_buffer-

"CONFIGURACION AUTOFORMATEO
noremap <F3> :Autoformat<CR>
nmap <Leader>f :Autoformat<CR>
