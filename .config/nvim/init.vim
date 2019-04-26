set nu
set mouse=a
set encoding=UTF-8
set listchars=tab:»»,space:·,eol:¬
set list

syntax on
colorscheme monokai

" check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
set autoread
au CursorHold * checktime

" Tabs configs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Activate omnicompletions
"filetype plugin on
"set omnifunc=syntaxcomplete#Complete<Paste>
"set completeopt=menu,menuone,preview,noselect,noinsert


call plug#begin('~/.local/share/nvim/plugged')
" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" Language
Plug 'bakpakin/janet.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" Productivity
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kana/vim-smartinput'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'lambdalisue/suda.vim'
Plug 'meain/vim-package-info', { 'do': 'npm install' }

" Rust Plugins
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'vim-syntastic/syntastic'
Plug 'majutsushi/tagbar'
call plug#end()

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <C-l> :exe "tabn ".g:lasttab<CR>
vnoremap <silent> <C-l> :exe "tabn ".g:lasttab<CR>
nnoremap <silent> <C-k> :tabn<CR>
nnoremap <silent> <C-j> :tabp<CR>
vnoremap <silent> <C-k> :tabn<CR>
vnoremap <silent> <C-k> :tabp<CR>


" Copy outside vim
vnoremap <silent> <C-y> "+y<CR>

" Toggle file tree
noremap <C-\> :NERDTreeToggle<CR>

" Toggle tagbar
nnoremap <F8> :TagbarToggle<CR>

" Enable fuzzy files search
nnoremap ; :Files<CR>

" Suda plugin
" this let us to do stuff on non permited files when we forget to type sudo first
" Write file
cnoremap W!! <bar> :w suda://%<CR>
" Write and quit file
cnoremap WQ!! <bar> :wq suda://%<CR>
" Read file
cnoremap R!! <bar> :r suda://%<CR>
" Open current file with sudo
cnoremap E!! <bar> :e suda://%<CR>

" Tabs shortcuts
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" Package info
let g:vim_package_info_virutaltext_prefix = '  ¤ '

" deoplete
"let g:deoplete#enable_at_startup=1
"noremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-i>"

" Config ale plugin
let g:ale_linters = {
\    'rust': ['rls'],
\    'r': ['lintr'],
\    'python': ['pyls', 'pyflakes', 'yapf'],
\    'ocaml': ['merlin', 'ols', 'ocamlformat'],
\    'julia': ['languageserver'],
\    'c++': ['clangd', 'flawfinder'],
\    'c': ['clangd', 'flawfinder'],
\    'clojure': ['joker'],
\    'elm': ['elm-format', 'elm-make'],
\    'asm': ['gcc'],
\}
let g:ale_completion_enabled = 1
let g:ale_rust_cargo_use_clippy = 1

" Airline config
let g:airline#extensions#tabline#ale#enabled = 1
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" Syntastic config
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1

" Vim Racer
" set hidden
" let g:racer_cmd = "/home/grayjack/.cargo/bin/racer"
" let g:racer_experimental_completer = 1
"au FileType rust nmap gd <Plug>(rust-def)
"au FileType rust nmap gs <Plug>(rust-def-split)
"au FileType rust nmap gx <Plug>(rust-def-vertical)
"au FileType rust nmap <leader>gd <Plug>(rust-doc)

" Poliglot
let g:polyglot_disabled = ['python', 'python-ident']
