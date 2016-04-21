set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"""""""""""
" Plugins "
"""""""""""
Plugin 'gmarik/vundle'

Plugin 'godlygeek/tabular'
Plugin 'rodjek/vim-puppet'
Plugin 'scrooloose/syntastic'

" Other plugins
Plugin 'bling/vim-airline'
Plugin 'chrisbra/SudoEdit.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'

Plugin 'ntpeters/vim-better-whitespace' " highlightning for whitespace

Plugin 'ekalinin/Dockerfile.vim'
Plugin 'hashivim/vim-vagrant' " vagrant tab completion
Plugin 'hashivim/vim-packer' " packer tab completion

" Autocomplete and Snippets
Plugin 'Shougo/neocomplete'

Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'

" Install ctags
Plugin 'majutsushi/tagbar'

" Color schemes
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomasr/molokai'

"----------------------------------------------------------------------
" Gvim
"----------------------------------------------------------------------

if has("gui_running")
  if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
  endif
endif

"----------------------------------------------------------------------
" Basic Options
"----------------------------------------------------------------------
" Automatically detect file types.
filetype plugin indent on
scriptencoding utf-8
set encoding=utf-8

set shell=/bin/bash\ -i

" Reads the file again if a change outside vim happened
set autoread

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

" history
set history=1000

"----------------------------------------------------------------------
" swap, backup, undo
"----------------------------------------------------------------------
set backup " tell vim to keep a backup file
set backupdir=$HOME/.vim/backup " tell vim where to put its backup files
set dir=$HOME/.vim/swap " tell vim where to put swap files

set undofile
set undodir=$HOME/.vim/undo

"----------------------------------------------------------------------
" colorschemes
"----------------------------------------------------------------------
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

" Neocomplete
" https://github.com/Shougo/neocomplete.vim
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 15
let g:neocomplete#force_overwrite_completefunc = 1

"let g:acp_enableAtStartup = 0
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#enable_smart_case = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<TAB>" : "\<Plug>(neosnippet_expand_or_jump)"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets,~/.vim/personal_snippits'

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
