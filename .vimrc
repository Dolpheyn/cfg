set number	
set linebreak
set showbreak=+++
set textwidth=100
set showmatch	
set visualbell	
 
set hlsearch	
set smartcase	
set ignorecase	
set incsearch	
 
set autoindent	
set shiftwidth=4	
set smartindent	
set smarttab	
set softtabstop=4	
 
set ruler	
 
set undolevels=1000	
set backspace=indent,eol,start	

set mouse=a

execute pathogen#infect()
syntax on
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
