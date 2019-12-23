let mapleader="\<SPACE>"
let maplocalleader ="\<SPACE>"


call plug#begin()
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'xolox/vim-misc'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'neomake/neomake'
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'
Plug 'chrisbra/csv.vim'
Plug 'mindriot101/vim-yapf'
Plug 'cespare/vim-toml'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
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

let g:airline_theme='base16'

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
  autocmd BufEnter NERD_* setlocal nonumber norelativenumber
  autocmd BufEnter,TermOpen,TermEnter,TermLeave term://* setlocal nonumber norelativenumber
augroup END

autocmd BufWritePre *.rs :call LanguageClient_textDocument_formatting()
autocmd BufWritePre *.py :call Yapf()

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

let g:deoplete#enable_at_startup = 1

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'sh': ['bash-language-server', 'start'],
    \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

let g:user_emmet_install_global = 0
autocmd FileType html,css,htmldjango EmmetInstall
let g:user_emmet_leader_key='<C-Z>'

let g:yapf_style = "google"

let g:python3_host_prog = $HOME . '/miniconda3/envs/nvim/bin/python'
let $VIRTUAL_ENV=$CONDA_PREFIX
