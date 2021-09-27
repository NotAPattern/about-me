" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Dec 17
" 
" Rewriter: Nikita Karatsev <nikita.karatsev@gmail.com>
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

set nobackup							"  do not keep a backup file, use versions instead
set undofile						  " keep an undo file (undo changes after closing)
set ttyfast							  " set faster terminal
set shell=/usr/bin/zsh	" change Unix shell

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

"=Plugin="
filetype plugin indent on 
set encoding=utf-8 
set nocompatible 
"=Plugin="

"=Vim-plug=
if empty(glob('~/.vim/autoload/plug.vim')) 
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"=Vim-plug="

"=Plugins="
call plug#begin('~/.vim/plugins') 
Plug 'flrnprz/plastic.vim'
Plug 'jaredgorski/fogbell.vim'
Plug 'vim-airline/vim-airline'
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-surround'
call plug#end()
"=Plugins="

"=Settings="
" Color scheme
set termguicolors
set background=dark
syntax on
colorscheme plastic 
" colorscheme fogbell_lite

let g:lightline = {'colorscheme': 'plastic'}

" Airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" let g:Powerline_symbols='unicode'

" ArilineTheme
let g:airline_theme='atomic'

" Font
set guifont=ttf-fira-code

" Rus lang
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

" Non default Tab
set tabstop=2
set shiftwidth=2
set number

" YouComplete
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
let g:ycm_use_clangd=1

" C/C++ settings
set makeprg=make\ -C\ ../build\ -j9

" Rust
let g:rustfmt_autosave=1
set completeopt-=preview
"=Settings="

