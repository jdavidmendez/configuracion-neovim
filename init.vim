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
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set ai "Auto indent
set si "Smart indent
set nowrap
" Set to auto read when a file is changed from the outside
set autoread

call plug#begin('~/.vim/plugged')

" temas
Plug 'morhetz/gruvbox'

"IDE
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'

"barra de estado con intregracion varios pluggins
Plug 'vim-airline/vim-airline'

" Temas para airline
Plug 'vim-airline/vim-airline-themes'

" muestra lineas verticales en espaciados
Plug 'Yggdroot/indentLine'

"AUTO COMPLETADO COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
Plug 'mlaursen/rmd-vim-snippets'

" Ultisnips React
Plug 'SirVer/ultisnips'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }

" allows \bo to close all buffers except current focus
Plug 'vim-scripts/BufOnly.vim'

Plug 'hail2u/vim-css3-syntax' " updates vim's built-in css to support CSS3
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'

" I don't want the snippets provided by this package as I like my own vim-react-snippets
Plug 'HerringtonDarkholme/yats.vim', {'do': 'rm -rf UltiSnips'}
Plug 'maxmellon/vim-jsx-pretty'

" easy comments with `gc` or `gcc`
Plug 'tpope/vim-commentary'

"Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"terminal flotante
Plug 'voldikss/vim-floaterm'
call plug#end()


"**** TEMA INSTALADO
colorscheme gruvbox
let g:gruvbox_contrast_dark

"**** CONFIGURACION DE BARRA NAVEGACIÓN ARCHIVOS
let NERDTreeQuitOnOpen=1
let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual

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
" autocmd FileType python let b:coc_suggest_disable = 1
" autocmd FileType javascript let b:coc_suggest_disable = 1
" autocmd FileType scss setl iskeyword+=@-@
" imap <C-t> <Plug>(coc-snippets-expand)
nnoremap <space>e :CocCommand explorer<CR>

" coc extensiones
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
                  \ 'coc-emmet',
                  \ 'coc-vimlsp',
                  \ 'coc-yank',
                  \ 'coc-stylelintplus',
                  \ ]

"CONFIGURACION SUPERTAB
" Invertir direccion de navegacion del autocompletado (de arriba a abajo)
let g:SuperTabDefaultCompletionType = '<c-n>'


"**** CONFIGURACION MOTOR ANALIZADOR DE CODIGO
" Mostrar mejor mensajes de error
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


"****CONFIGURACION BUSQUEDA INCREMENTAL
" Quitar resaltado luego de buscar
let g:incsearch#auto_nohlsearch = 1

"**** CONFIGURACIONES NERDCOMMENTER
let g:NERDSpaceDelims = 1  " Agregar un espacio después del delimitador del comentario
let g:NERDTrimTrailingWhitespace = 1  " Quitar espacios al quitar comentario
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" ****CONFIGURACIONES DE COMANDOS****
"  ================================================================
" UltiSnips
" ================================================================
let g:UltiSnipsExpandTrigger='<c-space>'

" autosabe toggle automatico al inicio
let g:auto_save = 1  " enable AutoSave on Vim startup

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
" fix-it -- show preview window of fixable things and choose fix
nmap <silent>fi <Plug>(coc-codeaction)
" fix eslint (also any other fixable things. Mostly used for React hook dependencies)
nmap <silent>fe <Plug>(coc-fix-current)
" fix eslint (all)
nmap <silent>fE :<C-u>CocCommand eslint.executeAutofix<cr>
" fix imports
nmap <silent>fI :<C-u>CocCommand tsserver.organizeImports<cr>
nmap <silent> ff <Plug>(coc-format)

" Autocompletar elemento seleccionado de la lista
if exists('*complete_info')
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
      imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
      else
            call CocAction('doHover')
      endif
endfunction



" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" quickly jump between diagnostics
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

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
nmap <Leader>f :Autoformat<CR>c

" ================================================================
" => Moving around, tabs, windows and buffers
" ================================================================
" Close all buffers except current
map <leader>bo :BufOnly<cr>
" Remember info about open buffers on close
set viminfo^=%

" ================================================================
" vim-closetag
" ================================================================
" Update closetag to also work on js and html files, don't want ts since <> is used for type args
let g:closetag_filenames='*.html,*.js,*.jsx,*.tsx'
let g:closetag_regions = {
                  \ 'typescript': 'jsxRegion',
                  \ 'typescriptreact': 'jsxRegion,tsxRegion',
                  \ 'typescript.tsx': 'jsxRegion,tsxRegion',
                  \ 'javascript.jsx': 'jsxRegion',
                  \ 'javascriptreact': 'jsxRegion',
                  \ }

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"configura las visualizaciones para vim-javascript, habilita el cambio a
"simbolos de algunos componentes en javascript como lo son arrow functions
" let g:javascript_conceal_function             = "ƒ"
" let g:javascript_conceal_null                 = "ø"
" let g:javascript_conceal_this                 = "@"
" let g:javascript_conceal_return               = "⇚"
" let g:javascript_conceal_undefined            = "¿"
" let g:javascript_conceal_NaN                  = "ℕ"
" let g:javascript_conceal_prototype            = "¶"
" let g:javascript_conceal_static               = "•"
" let g:javascript_conceal_super                = "Ω"
" let g:javascript_conceal_arrow_function       = "⇒"
" let g:javascript_conceal_noarg_arrow_function = "🞅"
" let g:javascript_conceal_underscore_arrow_function = "🞅"

"configuración terminal toggle
let g:floaterm_keymap_new    = '<F5>'
let g:floaterm_keymap_prev   = '<F6>'
let g:floaterm_keymap_next   = '<F7>'
let g:floaterm_keymap_toggle = '<F8>'
