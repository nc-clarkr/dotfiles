if has('vim_starting')
  set nocompatible
  set rtp+=~/.vim/bundle/neobundle.vim/
end

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'mileszs/ack.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle'janko-m/vim-test'
NeoBundle 'tpope/vim-dispatch'

NeoBundleCheck

call neobundle#end()

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

"""""""""""""
" vim-test
"""""""""""""

" Helpful bindings
nnoremap <silent> t<C-n> :TestNearest<CR>
nnoremap <silent> t<C-f> :TestFile<CR>
nnoremap <silent> t<C-s> :TestSuite<CR>
nnoremap <silent> t<C-l> :TestLast<CR>
nnoremap <silent> t<C-g> :TestVisit<CR>

" Run tests using dispatch strategy
let test#strategy = 'dispatch'

" Run rspec tests using spring
let test#ruby#rspec#executable = 'spring rspec'


"""""""""""
"" Other 
"""""""""""

" Map leader to space
let mapleader=" "

" Map \j to a full-file JSON object formatting macro
noremap <silent> <leader>j :%!python -m json.tool<CR>:set ft=javascript<CR>
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

" Solarized
colorscheme solarized

" Support syntax highlighting in terminal vim
syntax on
set background=dark

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
