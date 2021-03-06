set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"""""""""""
" Plugins "
"""""""""""
Plugin 'gmarik/vundle'
Plugin 'godlygeek/tabular'

" Indent Guides is a plugin for visually displaying indent levels in Vim.
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Vimjas/vim-python-pep8-indent'

" Languages
Plugin 'fatih/vim-go'

Plugin 'rodjek/vim-puppet'
Plugin 'scrooloose/syntastic'

" Git wrapper
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'

" Other plugins
Plugin 'jamessan/vim-gnupg'
Plugin 'bling/vim-airline'
Plugin 'chrisbra/SudoEdit.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'unblevable/quick-scope'

Plugin 'ntpeters/vim-better-whitespace' " highlighting for whitespace

Plugin 'ekalinin/Dockerfile.vim'
Plugin 'hashivim/vim-vagrant' " vagrant tab completion
Plugin 'hashivim/vim-packer' " packer tab completion
Plugin 'Glench/Vim-Jinja2-Syntax' " jinja2 syntax highlighting and indenting

" Autocomplete and Snippets
Plugin 'Shougo/neocomplete'

Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'

" Install ctags
" package name exuberant-ctags
Plugin 'majutsushi/tagbar'

" Color schemes
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomasr/molokai'
Plugin 'cocopon/iceberg.vim'

"----------------------------------------------------------------------
" Gvim
"----------------------------------------------------------------------

if has("gui_running")
  if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ 10
  endif
endif

"----------------------------------------------------------------------
" Basic Options
"----------------------------------------------------------------------
" Automatically detect file types.
filetype plugin indent on
scriptencoding utf-8
set encoding=utf-8

" Fixes
" Weird characters in conjunction with vim and vim git [>4;2m
" https://vi.stackexchange.com/questions/27399/whats-t-te-and-t-ti-added-by-vim-8
let &t_TI = ""
let &t_TE = ""

" breaks vimgrep
" set shell=/bin/bash\ -i

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

" https://unix.stackexchange.com/questions/196098/copy-paste-in-xfce4-terminal-adds-0-and-1
" enable bracketed paste mode
" https://vimhelp.org/term.txt.html#xterm-bracketed-paste
set t_BE=

"----------------------------------------------------------------------
" swap, backup, undo
"----------------------------------------------------------------------
set backup " tell vim to keep a backup file
set backupdir=$HOME/.vim/backup " tell vim where to put its backup files
set dir=$HOME/.vim/swap " tell vim where to put swap files

set undofile
set undodir=$HOME/.vim/undo

"----------------------------------------------------------------------
" customize colors for quick-scope
"----------------------------------------------------------------------
if has("autocmd")
  augroup qs_colors
    autocmd!
    autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
  augroup END
endif

"----------------------------------------------------------------------
" colorschemes
"----------------------------------------------------------------------
colorscheme iceberg
set background=dark

augroup vimrc
augroup END

"----------------------------------------------------------------------
" Autocommands
"----------------------------------------------------------------------
if has("autocmd")
  " Clear whitespace at the end of lines automatically
  autocmd BufWritePre * :%s/\s\+$//e

  " Automatic reload .vimrc
  autocmd bufwritepost .vimrc so $MYVIMRC

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

  " https://github.com/jamessan/vim-gnupg/issues/58
  autocmd User GnuPG set t_Co=256
endif

"----------------------------------------------------------------------
" Split navigation
"----------------------------------------------------------------------
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

"----------------------------------------------------------------------
" Paste options
"----------------------------------------------------------------------
set pastetoggle=<f5>

"----------------------------------------------------------------------
" Different styles of tab mode
"----------------------------------------------------------------------
nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

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
" Counting numbers
"----------------------------------------------------------------------

"This will cause Vim to treat numerals as decimal, regardless of whether they
"are padded with zeros.
"
"As of version 8.0 of Vim, the ‘nrformats’ setting excludes the octal option by
"default,
set nrformats-=octal

" autocomplete menu behaves like zsh
set wildmenu
set wildmode=full

"----------------------------------------------------------------------
" Plugin settings
"----------------------------------------------------------------------

" GPG
let g:GPGExecutable = 'gpg2'

" Indent Guides
" https://github.com/nathanaelkane/vim-indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Neocomplete
" https://github.com/Shougo/neocomplete.vim
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 15
let g:neocomplete#force_overwrite_completefunc = 1

" always use completions from all buffers
if !exists('g:neocomplete#same_filetypes')
  let g:neocomplete#same_filetypes = {}
endif
let g:neocomplete#same_filetypes._ = '_'

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
" TODO
" check why this is here!
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets,~/.vim/personal_snippits'

" Airline
let g:airline_powerline_fonts = 1
" let g:airline_theme = "wombat"
let g:airline#extensions#tabline#enabled = 1

" Tagbar
nmap <F8> :TagbarOpenAutoClose<CR>
let g:tagbar_autopreview = 1
let g:tagbar_show_linenumbers = 1

" SudoEdit
let g:sudo_no_gui=1

set conceallevel=0 " 0 = Text is shown normally
