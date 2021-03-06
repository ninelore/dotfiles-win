set nocompatible
call plug#begin('~/.local/share/nvim/plugged')

" Aesthetics
Plug 'chriskempson/base16-vim'
Plug 'sheerun/vim-polyglot'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'itchyny/lightline.vim'
Plug 'mike-hearn/base16-vim-lightline'

" Language Server Protocol
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Auto complete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Utility
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'

" HTML/CSS Live Editing
Plug 'turbio/bracey.vim'

call plug#end()

"True Color support
if (empty($TMUX))
    if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif

" UI Configs
set number
set showmatch
set incsearch
set hlsearch

" Aesthetics
set t_Co=16
" colorscheme base16-default-dark

" Syntax
syntax on
filetype plugin on
filetype indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent
autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen " set C files to have doxygen comments

" Universal Clipboard
set clipboard=unnamedplus

" Go to tab by number
:let mapleader = "\<Space>"
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" Tabs
set showtabline=2

" === PLUGIN OPTIONS ===


" --> Vim-LSP

" CCLS Server
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {
	  \		'highlight': { 'lsRanges' : v:true },
	  \ },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc', 'c.doxygen'],
      \ })
endif

" HTML Server
if executable('html-languageserver')                         
  au User lsp_setup call lsp#register_server({               
    \ 'name': 'html-languageserver',                     
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},                                   
    \ 'whitelist': ['html'],                             
  \ })                                                       
endif   

" Flow JavaScript
if executable('flow')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'flow',
        \ 'cmd': {server_info->['flow', 'lsp', '--from', 'vim-lsp']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), '.flowconfig'))},
        \ 'whitelist': ['javascript', 'javascript.jsx'],
        \ })
endif

" CSS Server
if executable('css-languageserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'css-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
        \ 'whitelist': ['css', 'less', 'sass'],
        \ })
endif

" Language Server Configs
let g:lsp_signs_error = {'text': 'x'}
let g:lsp_signs_warning = {'text': '!'}
let g:lsp_signs_hint = {'text': '?'}
let g:lsp_virtual_text_enabled = 1
let g:lsp_highlight_references_enabled = 1

" --> asyncomplete.vim

" Tab Completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" --> NERDTree

nnoremap gn :NERDTreeToggle<CR>

" --> Lightline

 set noshowmode
 let g:lightline = {
      \ 'colorscheme': 'base16_default_dark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
