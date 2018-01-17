if has('vim_starting')
  set nocompatible
  set rtp+=~/.vim/bundle/neobundle.vim/
end

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'mileszs/ack.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Valloric/YouCompleteMe'

NeoBundleCheck

call neobundle#end()


"" NERDTree

"Map \r to reveal in NERDTree
nmap <silent> <leader>r :NERDTreeFind<CR>

"Map \n to toggle NERDTree
nmap <silent> <leader>n :NERDTreeToggle<CR>


"" Ack

"Map \a to Ack current word
nmap <leader>a :Ack <C-R><C-W><CR>


"" Other

"Map \j to a full-file JSON object formatting macro
noremap <silent> <leader>j :%!python -m json.tool<CR>:set ft=javascript<CR>

"Map \x to full-file XML formatting macro
noremap <silent> <leader>x O<ESC>ggVGgJ:s/> *</>\r</g<CR>:se ft=xml<CR>gg=G

"" Tab complete menu
set wildchar=<Tab> wildmenu wildmode=full

"" F5 buffer switching
:nnoremap <F5> :buffers<CR>:buffer<Space>

"" F6 buffer tabbing
set wildcharm=<C-z>
nnoremap <F6> :buffer <C-z><S-Tab>

""Map \q to delete the current buffer
noremap <silent> <leader>q :bd<CR>

"Map to edit and reload .vimrc
noremap <C-E><C-V> :sp $MYVIMRC<CR>
noremap <C-E><C-R> :source $MYVIMRC<CR>

"Simplify split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Use Q instead of @q to enable easier one-shot macros
noremap Q @q

"Improve searching
set ignorecase
set smartcase
set hlsearch
set incsearch

"Double-tap backslash to clear search results
nmap <silent> <leader>\ :silent :nohlsearch<CR>

" Tab/spaces config
set expandtab
set tabstop=2
set shiftwidth=2
set nowrap
set autoindent

"Set font/size
set guifont=Monaco:h16
"Show line numbers
set number

"Consolidate backup files
set backupdir=~/.vimtmp
set directory=~/.vimtmp

"Enable undo files
if version >= 703
  set undofile
  set undodir=~/.vimtmp
endif

"Turn ruler on to show character position
set ruler

"Set syntastic's jshintrc config
let g:syntastic_javascript_jshint_args = '--config ~/.jshintrc'

"Set ctrlp exclusions - if it isn't working, run :ClearAllCtrlPCaches
let g:ctrlp_custom_ignore = 'bower_components/\|node_modules/\|dist/'

" Solarized
colorscheme solarized

"Support syntax highlighting in terminal vim
syntax on
set background=dark

"Detect filetype and indent accordingly
filetype plugin indent on
