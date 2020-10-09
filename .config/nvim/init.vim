" General---------------------------------------------------------------------
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
set tabstop=2 softtabstop=2 expandtab
set shiftwidth=4	
set ruler	
set undolevels=1000	
set backspace=indent,eol,start	
set mouse=a
set nowrap
" \General--------------------------------------------------------------------

" Install---------------------------------------------------------------------
call plug#begin()

" Visuals/Non-language idk, tools?
Plug 'morhetz/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Language tings, LSP, Fixers, Linters etc
Plug 'w0rp/ale'
Plug 'posva/vim-vue'
Plug 'rust-lang/rust.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'leafgarland/typescript-vim'

" Fun stuffs
Plug 'vimwiki/vimwiki'
Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins'}

call plug#end()
" \Install--------------------------------------------------------------------

" Key Maps---------------------------------------------------------------------
noremap <Space> <Nop>
map <Space> <Leader>
noremap <leader>s :grep

" To go to next and previous search result location
noremap <silent> <leader>cn :cnext<CR>
noremap <silent> <leader>cp :cprevious<CR>
noremap <silent> <leader>co :copen<CR>

nnoremap <silent> <Leader>] :YcmCompleter GoTo<CR>
" For my VimWiki file names
" It replaces all spaces within a `( )` with underscores
nnoremap <silent> <Leader>r_ :.s/([^)]*)/\=substitute(submatch(0),' ','_','g')/<CR>
" \Key Maps--------------------------------------------------------------------


" Plugins----------------------------------------------------------------------
filetype plugin indent on

" Colourscheme ------------------------
set background=dark 
colorscheme gruvbox
" \Colourscheme -----------------------

" Auto Pairs cfg ----------------------
" Auto insert for <> pair in vue
au FileType vue     let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})
" \Auto Pairs cfg ---------------------

" Ctrl P cfg --------------------------
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|target'
" \Ctrl P cfg -------------------------

" YouCompleteMe cfg -------------------
let g:ycm_rust_src_path = '/home/dolpheyn/dev/rust/src'
" \YouCompleteMe cfg ------------------

" NERDTree cfg-------------------------

" Auto open nerd tree on enter
" autocmd VimEnter * NERDTree
" autocmd BufEnter * NERDTreeMirror

nmap <silent> <C-t> :NERDTreeToggle<CR>
nmap <silent> <F2> :NERDTreeFind<CR>
" \NERDTree cfg------------------------

" vimwiki cfg--------------------------
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{
			\ 'path': '~/vimwiki/',
			\ 'syntax': 'markdown', 
			\ 'ext': '.md'
			\ }]
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_ext2syntax = {}
" \vimwiki cfg-------------------------

" RustFmt cfg--------------------------
let g:rustfmt_autosave = 1
" \RustFmt cfg-------------------------

" Vue cfg------------------------------
let g:vue_pre_processors = []
" \Vue cfg-----------------------------

" Typescript cfg-----------------------
let g:typescript_compiler_binary = 'tsc'
" \Typescript cfg----------------------

" ALE cfg------------------------------

" Get typescript lint in vue with tsserver
" let g:ale_linter_aliases = {'vue': 'typescript'}
" let g:ale_linters = {
"  \ 'javascript': ['eslint'],
"  \ 'vue': ['eslint', 'tsserver'],
"  \ 'typescript': ['eslint', 'tsserver']
"  \ }
let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \ 'vue': ['eslint'],
 \ 'typescript': ['tslint', 'eslint']
 \ }
let g:ale_sign_error = '❌'
let g:ale_completion_tsserver_autoimport = 1
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
" \ALE cfg-----------------------------

" \PLUGINS--------------------------------------------------------------------

" Scripts---------------------------------------------------------------------
" From https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim#L104
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif
" \Scripts--------------------------------------------------------------------



