execute pathogen#infect()

" Map leader to space
let mapleader=" "

" Map \j to a full-file JSON object formatting macro
noremap <silent> <leader>j :%!python -m json.tool<CR>:set ft=json<CR>

" Map \x to full-file XML formatting macro
noremap <silent> <leader>x O<ESC>ggVGgJ:s/> *</>\r</g<CR>:se ft=xml<CR>gg=G

" Map \q to delete the current buffer
noremap <silent> <leader>q :bd!<CR>

" Solarized dark
colorscheme solarized
set background=dark

" NerdTree

" Map \r to reveal in NERDTree
nmap <silent> <leader>r :NERDTreeFind<CR>
" Map \n to toggle NERDTree
nmap <silent> <leader>n :NERDTreeToggle<CR>

let NERDTreeShowHidden=1

" Map <F2> to edit and <F3> to reload .vimrc
noremap <F2> :sp $MYVIMRC<CR>
noremap <F3> :source $MYVIMRC<CR>

" Simplify split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Use Q instead of @q to enable easier one-shot macros
noremap Q @q

" Show line numbers
set number

" Set font/size
set guifont=Monaco:h16

" Turn ruler on to show character position
set ruler

" Make it obvious where 100 characters is
set textwidth=100
set colorcolumn=+1

" Disable scrollbars when vertical split is present
:set guioptions-=L

" Map \a to Rg current word
nmap <leader>a :Rg <C-R><C-W><CR>

" Tab/spaces config
set expandtab
set tabstop=2
set shiftwidth=2
set nowrap
set autoindent

" Improve searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" Double-tap backslash to clear search results
nmap <silent> <leader>\ :silent :nohlsearch<CR>

" Consolidate backup files
set backupdir=~/.vimtmp
set directory=~/.vimtmp

" Enable undo files
if version >= 703
  set undofile
  set undodir=~/.vimtmp
endif

" disable the bell when using macvim
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" use ripgrep with ctrl+p
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'

  " rg is fast enough that ctrl+p doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
