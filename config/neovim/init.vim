" config {{{
set autoindent smartindent
set autoread
set background=dark
set colorcolumn=70,80,110
set cmdheight=2
set cursorline
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
set scrolloff=13
set printfont=Courier:h7
set printoptions=number:y

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufNewFile,BufRead *.code-workspace set filetype=json
autocmd BufNewFile,BufRead *.dtrace set filetype=dtrace
" }}}

" plugins {{{ {{{
call plug#begin('~/.config/nvim/plugs')
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
Plug '/usr/local/opt/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'alaviss/nim.nvim'
Plug 'cespare/vim-toml'
"Plug 'drewtempelmeyer/palenight.vim'
"Plug 'elixir-editors/vim-elixir'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'majutsushi/tagbar'
Plug 'mengelbrecht/lightline-bufferline'
"Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
"Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'vim-erlang/vim-erlang-runtime'
call plug#end()
" }}}

"" fzf {{{
map <F12> :Files<CR>
" }}}

"" deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}

"" Lignline {{{
let g:lightline = { 'active': {
    \   'left': [['mode', 'paste' ], ['gitbranch', 'readonly', 'filename', 'modified']],
    \   'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']] } }
let g:lightline.tabline = { 'left': [ ['buffers'] ] }
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
" }}}

"" NERDTree {{{
map <F7> :NERDTreeToggle<CR>
" }}}

"" Palenight {{{
" }}}

"" TagBar {{{
nmap <F8> :TagbarToggle<CR>
" }}}

"" Rainbow {{{
let g:rainbow_active = 1
" }}} }}}

" color theme {{{
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

let g:lightline.colorscheme = 'solarized'
" let g:lightline.colorscheme = 'one'
colorscheme solarized8
" colorscheme onehalfdark
" }}}

" vim: foldmethod=marker

