set nocompatible
syntax on
filetype plugin indent on

set number
set ruler
set cursorline
set wildmenu
set showcmd
set showmatch
set incsearch
set hlsearch
set lazyredraw
set hidden
set updatetime=300

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set autoindent

if has('termguicolors')
  set termguicolors
endif

set mouse=a
set clipboard=unnamedplus

let mapleader = ","

vnoremap <C-y> "+y
nnoremap <C-y> "+yy
nnoremap =j :%!python3 -m json.tool<CR>

if !has('clipboard')
  let g:clipboard = {
        \ 'name': 'wslclip',
        \ 'copy': {
        \   '+': 'clip.exe',
        \   '*': 'clip.exe',
        \ },
        \ 'paste': {
        \   '+': 'powershell.exe -NoProfile -Command Get-Clipboard',
        \   '*': 'powershell.exe -NoProfile -Command Get-Clipboard',
        \ },
        \ }
endif

if executable('python3')
  let g:python3_host_prog = '/usr/bin/python3'
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
