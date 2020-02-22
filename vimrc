let mapleader="\<SPACE>"
let maplocalleader ="\<SPACE>"


call plug#begin()
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'xolox/vim-misc'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'neomake/neomake'
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'
Plug 'chrisbra/csv.vim'
Plug 'cespare/vim-toml'
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'mattn/webapi-vim'
" Plug 'edkolev/tmuxline.vim' generated status line
call plug#end()

filetype plugin on

set background=dark
set clipboard+=unnamedplus
colorscheme gruvbox
highlight Normal guibg=NONE ctermbg=NONE
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2
set shiftround
set splitbelow
set splitright
set nohls
set rtp+=~/.fzf
set backspace=indent,eol,start
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set updatetime=100
set mouse=a
set completeopt=menu,menuone,preview,noselect,noinsert

let g:airline_theme='base16'

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
  autocmd BufEnter NERD_* setlocal nonumber norelativenumber
  autocmd BufEnter,TermOpen,TermEnter,TermLeave term://* setlocal nonumber norelativenumber
augroup END

" Nerd commenter
let g:NERDSpaceDelims = 1

" Nerd tree
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeGitStatusWithFlags = 1
set encoding=UTF-8
map <silent><c-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | echo argv()[0] | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>
nnoremap <leader>w <c-w>_
nnoremap <leader>h <c-w>\|
nnoremap <leader>z <c-w>=
nnoremap th :tabfirst<cr>
nnoremap tk :tabnext<cr>
nnoremap tj :tabprev<cr>
nnoremap tl :tablast<cr>
nnoremap td :tabclose<cr>
nnoremap <silent><f9> :w<cr>:source %<cr>
nnoremap <c-p> :FZF<cr>
nnoremap <c-f> :Ag<cr>

inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <silent><expr> <tab>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ "\<c-\><c-o>:ALEComplete<cr>"
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" emmet-vim settings
let g:user_emmet_install_global = 0
autocmd FileType html,css,htmldjango EmmetInstall
let g:user_emmet_leader_key='<C-Z>'

" Nvim-R settings
let R_assign = 2
let R_notmuxconf = 1
let R_in_buffer = 0
let R_source = $HOME . '/.vim/plugged/Nvim-R/R/tmux_split.vim'
let R_tmux_title = 'automatic'

 let g:ale_rust_rls_executable = 'ra_lsp_server'

let g:ale_fixers = {
      \   'rust': ['rustfmt'],
      \   'python': ['black'],
      \   'yaml': ['prettier'],
      \}
let g:ale_linters = {
      \'rust': ['rls', 'cargo'],
      \'python': ['pyls'],
      \}
let g:ale_sign_error = "✗"
let g:ale_sign_warning = "⚠"
" let g:ale_completion_enabled = 1
let g:ale_set_balloons = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:airline#extensions#ale#enabled = 1
nmap <silent> <leader>f <Plug>(ale_go_to_definition)
nmap <silent> <leader>k <Plug>(ale_hover)
