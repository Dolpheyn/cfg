" General---------------------------------------------------------------------
syntax enable

set autoindent	
set backspace=indent,eol,start	
set colorcolumn=80
set hlsearch	
set ignorecase	
set incsearch	
set linebreak
set mouse=a
set nocompatible
set noerrorbells
set noswapfile
set nowrap
set number	
set ruler	
set scrolloff=20
set shiftwidth=2
set showbreak=+++
set showmatch	
set smartcase	
set smartindent	
set smarttab	
set tabstop=2 softtabstop=2 expandtab
set textwidth=80
set undolevels=1000	

let g:python3_host_prog= '/usr/bin/python3'

" COC------------------------
" https://github.com/neoclide/coc.nvim#example-vim-configuration
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" \COC-----------------------
" \General--------------------------------------------------------------------

" Install---------------------------------------------------------------------
call plug#begin()

" Visuals/Non-language idk, tools?
Plug 'morhetz/gruvbox'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mattn/webapi-vim'

" Language tings, LSP, Fixers, Linters, Filetypes etc
" Plug 'w0rp/ale'
" Plug 'posva/vim-vue'
Plug 'chrisbra/csv.vim'
" Plug 'rust-lang/rust.vim'
Plug 'tomlion/vim-solidity'
" Plug 'Valloric/YouCompleteMe'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fun stuffs
Plug 'vimwiki/vimwiki'
Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins'}

call plug#end()
" \Install--------------------------------------------------------------------

" Key Maps---------------------------------------------------------------------
noremap <Space> <Nop>
map <Space> <Leader>
"noremap <leader>s :grep

" To go to next and previous search result location
noremap <silent> <leader>cn :cnext<CR>
noremap <silent> <leader>cp :cprevious<CR>
noremap <silent> <leader>co :copen<CR>

" nnoremap <silent> <Leader>] :YcmCompleter GoTo<CR>

" COC------------------------
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> cd  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> cp  :<C-u>CocListResume<CR>

" Mappings for Telescope
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>s <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" \COC-----------------------

" For my VimWiki file names
" It replaces all spaces within a `( )` with underscores
nnoremap <silent> <Leader>r_ :.s/([^)]*)/\=substitute(submatch(0),' ','_','g')/<CR>

" MarkdownToC
nmap <leader>toc :call MarkdownToC()<CR>
" \Key Maps--------------------------------------------------------------------


" Plugins----------------------------------------------------------------------
filetype plugin indent on

" Vim-vue-plugin-----------------------
"let g:vim_vue_plugin_lad_full_syntax=1
let g:vim_vue_plugin_use_scss=1
let g:vim_vue_plugin_highlight_vue_attr=1
let g:vim_vue_plugin_highlight_vue_keyword=1
" \Vim-vue-plugin----------------------
" Colourscheme ------------------------
set background=dark 
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
" \Colourscheme -----------------------

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

" Rainbow cfg--------------------------
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
" \Rainbow cfg-------------------------

" \PLUGINS--------------------------------------------------------------------

" Scripts---------------------------------------------------------------------
" From https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim#L104
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" https://www.reddit.com/r/neovim/comments/bjuufn/does_anyone_have_experience_configuring_neovim/
autocmd BufReadPost,BufNewFile *.vue setlocal filetype=vue


" No rainbow for markdown pls
autocmd FileType vimwiki :RainbowToggleOff

" COC------------------------
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" \COC-----------------------

" Function to insert table of content in a markdown
function! MarkdownToC()
  r~/.config/nvim/md/toc.txt
endfunction
" \Scripts--------------------------------------------------------------------
