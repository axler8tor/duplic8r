" config
set autoindent smartindent
set autoread
set cmdheight=2
set expandtab
set foldmethod=syntax
set incsearch
set laststatus=2
set lazyredraw
set number
set relativenumber
set shiftwidth=4
set showmatch
set smarttab
set softtabstop=4
set tabstop=4

autocmd BufWritePre * :%s/\s\+$//e


" plugins
call plug#begin('~/.config/nvim/plugs')
Plug 'majutsushi/tagbar'
Plug '/usr/local/opt/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'sonph/onehalf', { 'rtp': 'vim/' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
call plug#end()

"" fzf
map ; :Files<CR>

"" deoplete
let g:deoplete#enable_at_startup = 1

"" Lignline
let g:lightline = { 'active': {
    \   'left': [['mode', 'paste' ], ['gitbranch', 'readonly', 'filename', 'modified']],
    \   'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']] } }
let g:lightline.tabline = { 'left': [ ['buffers'] ] }
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

"" NERDTree
map <F7> :NERDTreeToggle<CR>

"" Palenight
let g:palenight_terminal_italics = 1
let g:lightline.colorscheme = 'palenight'

"" TagBar
nmap <F8> :TagbarToggle<CR>


" color theme
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

colorscheme palenight

