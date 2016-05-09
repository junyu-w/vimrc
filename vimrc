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
Plugin 'The-NERD-tree'
Plugin 'bling/vim-airline'
Plugin 'Shougo/neocomplete.vim'
Plugin 'mattn/emmet-vim'
Plugin 'Syntastic'
Plugin 'rails.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'airblade/vim-gitgutter'
Plugin 'rking/ag.vim'
Plugin 'majutsushi/tagbar'
Plugin 'whatyouhide/vim-gotham'
Plugin 'ap/vim-css-color'
Plugin 'flazz/vim-colorschemes'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'honza/vim-snippets'
Plugin 'vim-ruby/vim-ruby'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
set nocompatible


if has('syntax') && !exists('g:syntax_on')
  syntax enable			" Turn on syntax highlighting
endif

" Builtin plugins {{{1
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

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
" set cursorline
set incsearch
set scrolloff=2
set ttyfast
set clipboard=unnamed
" set a 80 char vertical line
" set colorcolumn=80
set nobackup
set noswapfile
set synmaxcol=120
set linespace=2
set novisualbell
set tabpagemax=50

map Y y$
" ---------------- CUSTOMIZED SETTINGS --------------------------

if has('gui_running')
  colorscheme Tomorrow-Night
else
  colorscheme default
endif


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


" --------------------- vim-airline symbols ----------------------
let g:airline_theme = 'dark'
let g:airline#extensions#syntastic#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" --------------------- tagbar related settings -------------------
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ---------------------- macvim guioptions -------------------
set guioptions-=m
set guioptions-=T
set guioptions-=R
set guioptions-=r
set guioptions-=l
set guioptions-=L
set guioptions-=b
set guioptions+=c
set guifont=Ubuntu\ Mono\ 13,Menlo\ Regular:h14
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
set splitbelow
set splitright

" -------------------- key mappings-----------------------
let mapleader = ","

nnoremap ; :
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-Z> :nohl<CR><C-L>
" easiy navigate between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Tabs (navigation)
nnoremap tl :tabnext<CR>
nnoremap th :tabprevious<CR>
nnoremap td :tabclose<CR>
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

"---------------------------------Ag-------------------------------------
nnoremap <leader>a :Ag!

"---------------------------------Tagbar--------------------------------
nnoremap <leader>t :TagbarToggle<CR>

" -------------------------------- NERD-TREE -----------------------------
nnoremap <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = [
  \ '\.pyc$',
  \ '\.class$',
  \ '\.o$',
  \ '\.exe$',
  \ '\.so$',
  \ '\.dll$',
  \ '\.aux$',
  \ '\.log$',
  \ '\.result$',
  \ '\.output$',
  \ '\.pdf$'
  \ ]

" -------------------------------------------CtrlP------------------------------
nnoremap <leader>ff :CtrlP<CR>
nnoremap <leader>fb :CtrlPBuffer<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip    " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|atom)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

if executable("ag")
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
        \ --ignore ".git"
        \ --ignore ".svn"
        \ --ignore ".hg"
        \ --ignore ".bundle"
        \ --ignore ".DS_Store"
        \ --ignore "*.pyc"
        \ --ignore "*.exe"
        \ --ignore "*.so"
        \ --ignore "*.dll"
        \ --ignore "*.class"
        \ --ignore "*.aux"
        \ --ignore "*.log"
        \ --ignore "*.result"
        \ --ignore "*.output"
        \ --ignore "*.pdf"
        \ -g ""'
endif


" ---------------- neosnippet --------------------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" ------------------ jsx ----------------------
let g:jsx_ext_required = 0

"--------------neocomplete---------------

" neocomplete {{{
let g:neocomplete#data_directory = '~/.vim/tmp/neocomplete'
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" increase limit for tag cache files
let g:neocomplete#sources#tags#cache_limit_size = 16777216 " 16MB

" fuzzy completion breaks dot-repeat more noticeably
" https://github.com/Shougo/neocomplete.vim/issues/332
let g:neocomplete#enable_fuzzy_completion = 1

" always use completions from all buffers
if !exists('g:neocomplete#same_filetypes')
  let g:neocomplete#same_filetypes = {}
endif
let g:neocomplete#same_filetypes._ = '_'

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


"-------------------AUTOCMD ----------------------------

" Filetype detection, plugins, indent, syntax {{{1
if has('autocmd')
  filetype plugin indent on	  " Turn on Filetype detection, plugins, and indent
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  " From https://github.com/thoughtbot/dotfiles/blob/master/vimrc
  autocmd! GUIEnter * set vb t_vb=
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd BufNewFile,BufRead *.go set filetype=go
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  " make js snippets available in html, and html.erb
  autocmd BufNewFile,BufRead *.html set filetype=html.javascript.jsx
  autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby
  autocmd BufNewFile,BufRead *.slim set filetype=slim
endif

syntax on
set background=dark
