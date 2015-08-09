" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'The-NERD-tree'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'mattn/emmet-vim'
Plugin 'Syntastic'
Plugin 'rails.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'burnettk/vim-angular'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'rking/ag.vim'
Plugin 'majutsushi/tagbar'
Plugin 'whatyouhide/vim-gotham'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'groovy.vim'
Plugin 'yonchu/accelerated-smooth-scroll'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set nocompatible
filetype indent plugin on
syntax on


"------------------------------------------------------------
" Must have options {{{1
"
set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set mouse=a
" "press <Enter> to continue"
set cmdheight=2
set number
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set shiftwidth=2
set softtabstop=2
set expandtab
set guifont=Menlo:h12

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2

map Y y$

" ---------------- CUSTOMIZED SETTINGS --------------------------

let g:ruby_path = system('rvm current')

if has('gui_running')
  set background=dark
  " colorscheme solarized
  " this is the atom dark color scheme
  colorscheme grb256
  " colorscheme jellybeans
  " colorscheme molokai
  " colorscheme Tomorrow-Night
  " colorscheme atom
else
  colorscheme Monokai
endif
" colorscheme solarized
set background=dark


"--------for Syntastic--------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=0

set linespace=2

" --------------------- vim-airline symbols ----------------------
let g:airline_theme = 'dark'
let g:airline#extensions#syntastic#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep           = '»'
let g:airline_left_sep           = '▶'
let g:airline_right_sep          = '«'
let g:airline_right_sep          = '◀'
let g:airline_symbols.linenr     = '␊'
let g:airline_symbols.linenr     = '␤'
let g:airline_symbols.linenr     = '¶'
let g:airline_symbols.branch     = '⎇'
let g:airline_symbols.paste      = 'ρ'
let g:airline_symbols.paste      = 'Þ'
let g:airline_symbols.paste      = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" --------------------- tagbar related settings -------------------
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ---------------------- Disable the scrollbars -------------------
set guioptions-=r
set guioptions-=L
set splitbelow
set splitright

" -------------------- Map leader key -----------------------
let mapleader = ","

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
" Ag key mapping
nnoremap <leader>a :Ag!
" Tagbar
nnoremap <leader>t :TagbarToggle<CR>
"NERD-TREE
nnoremap <leader>n :NERDTreeToggle<CR>
" easiy navigate between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" disable highlight with c-h
nnoremap <C-H> :nohl<CR>
