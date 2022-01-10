"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('mileszs/ack.vim')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('tpope/vim-surround')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('hashivim/vim-terraform')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"""""""""""
"" Other
"""""""""""

" Map leader to space
let mapleader=" "

" Map \j to a full-file JSON object formatting macro
noremap <silent> <leader>j :%!python -m json.tool<CR>:set ft=json<CR>

" Map \x to full-file XML formatting macro
noremap <silent> <leader>x O<ESC>ggVGgJ:s/> *</>\r</g<CR>:se ft=xml<CR>gg=G

" Map \q to delete the current buffer
noremap <silent> <leader>q :bd!<CR>

" Tab complete menu
set wildchar=<Tab> wildmenu wildmode=full

" F5 buffer switching
:nnoremap <F5> :buffers<CR>:buffer<Space>

" F6 buffer tabbing
set wildcharm=<C-z>
nnoremap <F6> :buffer <C-z><S-Tab>

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

" Improve searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" Double-tap backslash to clear search results
nmap <silent> <leader>\ :silent :nohlsearch<CR>

" Tab/spaces config
set expandtab
set tabstop=2
set shiftwidth=2
set nowrap
set autoindent

" Set font/size
set guifont=Monaco:h16
" Show line numbers
set number

" Consolidate backup files
set backupdir=~/.vimtmp
set directory=~/.vimtmp

" Enable undo files
if version >= 703
  set undofile
  set undodir=~/.vimtmp
endif

" Turn ruler on to show character position
set ruler

" Use Solarized
colorscheme solarized
" Solarized dark
set background=dark

" Support syntax highlighting in terminal vim
syntax on

" Detect filetype and indent accordingly
filetype plugin indent on

" Make it obvious where 100 characters is
set textwidth=100
set colorcolumn=+1

" Borrowed from https://github.com/thoughtbot/dotfiles/blob/master/vimrc:

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag with ack.vim
  let g:ackprg = 'ag --nogroup --nocolor --column'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Disable arrows
nnoremap <Left> :echoe 'Use h'<CR>
nnoremap <Right> :echoe 'Use l'<CR>
nnoremap <Up> :echoe 'Use k'<CR>
nnoremap <Down> :echoe 'Use j'<CR>
"""""""""
"" Ack
"""""""""

" Map \a to Ack current word
nmap <leader>a :Ack <C-R><C-W><CR>

"""""""""
"" CtrlP
"""""""""

" Set ctrlp exclusions - if it isn't working, run :ClearAllCtrlPCaches
let g:ctrlp_custom_ignore = 'bower_components/\|node_modules/\|dist/'

""""""""""""""
"" NERDTree
""""""""""""""

" Map \r to reveal in NERDTree
nmap <silent> <leader>r :NERDTreeFind<CR>

" Map \n to toggle NERDTree
nmap <silent> <leader>n :NERDTreeToggle<CR>

" Show hidden files in NERDTree
let NERDTreeShowHidden=1


""""""""""""""
"" Syntastic
""""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""
"" vim-ruby
""""""""""""""

let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_hanging_elements = 0


""""""""""""""
"" disable the bell when using macvim
""""""""""""""
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=


""""""""""""""
"" Terraform
""""""""""""""
let g:terraform_fmt_on_save=1
