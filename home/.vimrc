set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"""""""""""
" Plugins "
"""""""""""
Plugin 'gmarik/vundle'

" Bundle "elzr/vim-json"

Plugin 'godlygeek/tabular'
Plugin 'rodjek/vim-puppet'
Plugin 'scrooloose/syntastic'

" Other plugins
Plugin 'bling/vim-airline'
Plugin 'chrisbra/SudoEdit.vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'

" Install ctags
Plugin 'majutsushi/tagbar'

" Color schemes
Plugin 'nanotech/jellybeans.vim'
Plugin 'tomasr/molokai'

" Turn on filetype plugin and indent loading so that loading the
" vim-misc stuff below loads the proper files.
filetype plugin indent on

scriptencoding utf-8
set encoding=utf-8

" gvim

if has("gui_running")
  if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
  endif
endif

"----------------------------------------------------------------------
"" Basic Options
"----------------------------------------------------------------------

set cursorline " Highlight the line the cursor is on
set laststatus=2 " Always show the status bar
set number
set t_Co=256 " Use 256 colors
set showmatch " Highlight matching braces


syntax on " Enable filetype detection by syntax

" Search settings
set hlsearch " Highlight results
set incsearch " Start showing results as you type
set ignorecase " Case insensitiv search

colorscheme molokai

augroup vimrc
augroup END

if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC

  filetype on
  autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
  autocmd BufNewFile,BufRead *.erb set filetype=ruby
  autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
  autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType sh   setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType ino  setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType rst  setlocal ts=4 sts=4 sw=4 list
endif

"----------------------------------------------------------------------
" Split navigation
"----------------------------------------------------------------------
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

"----------------------------------------------------------------------
" Help properties
"----------------------------------------------------------------------
set helpheight=40

"----------------------------------------------------------------------
" Spell checking
"----------------------------------------------------------------------
" See: http://vimcasts.org/episodes/spell-checking/

" Toggle spell checking on and off with `,s`
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>

" Set region to British English
set spelllang=en_us

"----------------------------------------------------------------------
" Plugin settings
"----------------------------------------------------------------------
" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = "wombat"
let g:airline#extensions#tabline#enabled = 1

" Tagbar
nmap <F8> :TagbarOpenAutoClose<CR>
let g:tagbar_autopreview = 1
let g:tagbar_show_linenumbers = 1

" SudoEdit
let g:sudo_no_gui=1

"----------------------------------------------------------------------
" Autocommands
"----------------------------------------------------------------------
" Clear whitespace at the end of lines automatically
autocmd BufWritePre * :%s/\s\+$//e
