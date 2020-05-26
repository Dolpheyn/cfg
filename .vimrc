syntax on

set noerrorbells
set number	
set linebreak
set showbreak=+++
set textwidth=100
set showmatch	
set noswapfile
set hlsearch	
set smartcase	
set ignorecase	
set incsearch	
set autoindent	
set smartindent	
set smarttab	
set tabstop=4 softtabstop=4	
set shiftwidth=4	
set ruler	
set undolevels=1000	
set backspace=indent,eol,start	
set mouse=a

"-----------KEY MAPS------------
noremap <Space> <Nop>
map <Space> <Leader>

nnoremap <Leader>] :YcmCompleter GoTo<CR>


"-----------PLUGINS--------------
execute pathogen#infect()

filetype plugin indent on

" YouCompleteMe cfg
let g:ycm_rust_src_path="/home/dolpheyn/dev/rust/src"
" end YouCompleteMe cfg

" NERDTree cfg
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror

nmap <silent> <C-t> :NERDTreeToggle<CR>
nmap <silent> <F2> :NERDTreeFind<CR>
" end NERDTree cfg
