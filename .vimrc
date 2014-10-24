" My .vimrc
" Inspired by
" https://github.com/holser/dotfiles/blob/master/.vimrc
" https://github.com/vgod/vimrc/blob/master/vimrc
" https://github.com/derekwyatt/vim-config/blob/master/vimrc
" http://spf13.com/post/perfect-vimrc-vim-config-file/

set nocompatible        " not compatible with old-fashion vi mode

" Vundle section
filetype off

set rtp+=~/.vim/bundle/vundle/

call vundle#begin()
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'bling/vim-airline'
Bundle 'vim-ruby/vim-ruby'
Bundle 'plasticboy/vim-markdown'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'msanders/snipmate.vim'
Bundle 'rodjek/vim-puppet'
Bundle 'Rykka/riv.vim'
Bundle 'rykka/clickable.vim'
call vundle#end()

filetype plugin on      " enable filetype-specific indenting
filetype indent on      " Enable filetype-specific plugins
filetype on             " enable filetype detection

" General Settings

set history=100         " keep 100 lines of last commands in history
set autoread            " automatically read a file that is changed from outside
syntax on               " syntax highlight

if has("gui_running")   " GUI colors and font settings
    set guifont=Consolas:h14
    set background=dark
    colorscheme solarized
    set guioptions-=r   " Removing right scroll bar
endif

set clipboard+=unnamed  " yank to the system register (*) by default
set wildmenu            " wild char completion menu

set hlsearch            " search highlighting
set incsearch           " incremental search

" Ingore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc
set nobackup            " no *~ backup files
set nowritebackup
set noswapfile

" set number      " Line numbering is on
set autoindent  " auto indentation
set smartindent " Use smart indendation if there is no indent file
set copyindent  " copy the previous indentation on autoindenting
set ignorecase  " ignore case when searching
set smartcase   " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab    " insert tabs on start of line according to context

set backspace=2   " allow backspacing over everything including indent, eol in insert mode
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set modeline      " Save tab specific settings to file /* ex: set tabstop=8 expandtab: */

" Language Settings
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set spelllang=ru_yo,en_us
highlight lCursor guifg=NONE guibg=Blue

" ENCODING SETTINGS
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp1251,latin1
set fileformats=unix,dos,mac

set ls=2                " Allways show status line
set confirm
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

" Hide matches on double esc
nnoremap <esc><esc> :noh<CR>

" Use tabs to move between bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" Ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

" Remove trailing whitespace on <leader>S
nnoremap <leader>s :%s/\s\+$//<cr>:let @/=''<CR>

function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

set nofoldenable
