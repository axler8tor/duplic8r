" Axl's Configuration
set autoread
set cmdheight=2
set laststatus=2
set lazyredraw
set number
set relativenumber


" Plugs
call plug#begin('~/.config/nvim/plugs')
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

" Lignline
let g:lightline = { 'active': { 'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

" NERDTree
map <C-n> :NERDTreeToggle<CR>

