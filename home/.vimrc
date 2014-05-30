set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Bundle "elzr/vim-json"

" Other plugins
Bundle 'bling/vim-airline'
Bundle 'vim-scripts/SudoEdit.vim'
Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'

" Color schemes
Bundle 'nanotech/jellybeans.vim'
Bundle 'tomasr/molokai'

" Turn on filetype plugin and indent loading so that loading the
" vim-misc stuff below loads the proper files.
filetype plugin indent on

scriptencoding utf-8
set encoding=utf-8

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

colorscheme molokai

augroup vimrc
augroup END

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC

	filetype on
	autocmd BufNewFile,BufRead *.ts set filetype=typoscript
	autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
	autocmd BufNewFile,BufRead *.erb set filetype=ruby

	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType typoscript setlocal ts=2 sts=2 sw=2 expandtab
endif

"----------------------------------------------------------------------
" Plugin settings
"----------------------------------------------------------------------
" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = "wombat"
let g:airline#extensions#tabline#enabled = 1

nmap <F8> :TagbarOpenAutoClose<CR>
let g:tagbar_autopreview = 1
let g:tagbar_show_linenumbers = 1

"----------------------------------------------------------------------
" Autocommands
"----------------------------------------------------------------------
" Clear whitespace at the end of lines automatically
autocmd BufWritePre * :%s/\s\+$//e
