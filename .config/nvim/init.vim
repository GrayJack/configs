set nu
set mouse=a
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
filetype plugin on
set omnifunc=syntaxcomplete#Complete<Paste>
set completeopt=menu,menuone,preview,noselect,noinsert

call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf.vim'

"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'terryma/vim-multiple-cursors'

Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'airblade/vim-gitgutter'

Plug 'w0rp/ale'

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Rust Plugins
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }

Plug 'vim-syntastic/syntastic'
Plug 'majutsushi/tagbar'

Plug 'kana/vim-smartinput'

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

call plug#end()

" Toggle file tree
map <C-\> :NERDTreeToggle<CR>

" Toggle tagbar
nmap <F8> :TagbarToggle<CR> 

" Enable fuzzy files search
map ; :Files<CR>

" deoplete
let g:deoplete#enable_at_startup=1
map <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-i>"

" Config ale plugin
let g:ale_linters = {
\    'rust': ['rls'],
\    'r': ['lintr'],
\    'python': ['pyflakes', 'flake8', 'pyls', 'autopep8'],
\    'ocaml': ['ols', 'ocamlformat'],
\    'julia': ['languageserver'],
\    'c++': ['clangd', 'flawfinder'],
\    'c': ['cland', 'flawfinder'],
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
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = ''

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Vim Racer
set hidden
let g:racer_cmd = "/home/grayjack/.cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)