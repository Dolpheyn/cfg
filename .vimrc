syntax on

set nocompatible
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
set nowrap

"-----------KEY MAPS------------
noremap <Space> <Nop>
map <Space> <Leader>

nnoremap <Leader>] :YcmCompleter GoTo<CR>
nnoremap <Leader>r_ :.s/([^)]*)/\=substitute(submatch(0),' ','_','g')/<CR>
"-----------\KEY MAPS-----------


"-----------PLUGINS--------------
execute pathogen#infect()

filetype plugin indent on

" Colourscheme -----------------------------
set background=dark 
colorscheme gruvbox
" \Colourscheme -----------------------------

" Ctrl P cfg -----------------------------
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" \Ctrl P cfg -----------------------------

" YouCompleteMe cfg -----------------------------
let g:ycm_rust_src_path="/home/dolpheyn/dev/rust/src"
" \YouCompleteMe cfg -----------------------------

" NERDTree cfg-----------------------------
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror

nmap <silent> <C-t> :NERDTreeToggle<CR>
nmap <silent> <F2> :NERDTreeFind<CR>
" \NERDTree cfg-----------------------------

" vimwiki cfg-----------------------------
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{
			\ 'path': '~/vimwiki/',
			\ 'syntax': 'markdown', 
			\ 'ext': '.md'
			\ }]
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_ext2syntax = {}
" \vimwiki cfg-----------------------------

" RustFmt cfg-----------------------------
let g:rustfmt_autosave = 1
" \RustFmt cfg-----------------------------

" Vue cfg-----------------------------
let g:vue_pre_processors = []
" \Vue cfg-----------------------------

" Typescript cfg-----------------------------
let g:typescript_compiler_binary = 'tsc'
" \Typescript cfg-----------------------------

" ALE cfg-----------------------------
let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \ 'vue': ['eslint'],
 \ 'typescript': ['tslint']
 \ }
let g:ale_sign_error = '❌'
let g:ale_completion_tsserver_autoimport = 1
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
" \ALE cfg-----------------------------

"----------\PLUGINS--------------
