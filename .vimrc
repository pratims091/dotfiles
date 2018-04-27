set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set nu                          " set line number
filetype off                    " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'thoughtbot/vim-rspec'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'tomtom/tcomment_vim'
Bundle 'dyng/ctrlsf.vim'
Plugin 'tpope/vim-fugitive.git'
Plugin 'vim-airline/vim-airline'
Plugin 'https://github.com/tpope/vim-surround.git'
Plugin 'https://github.com/vim-syntastic/syntastic.git'
Plugin 'https://github.com/spf13/vim-autoclose.git'
Plugin 'https://github.com/godlygeek/tabular.git'
Plugin 'https://github.com/majutsushi/tagbar.git'
Plugin 'flazz/vim-colorschemes'
Plugin 'https://github.com/google/vim-searchindex'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set runtimepath^=~/.vim/bundle/ctrlp.vim
" open a NERDTree automatically when vim starts up if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

colorscheme railscasts

set tags=/home/pratim/work/tags;
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
scriptencoding utf-8

if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

set spell

set backup                  " Backups are nice ...

if has('persistent_undo')
  set undofile                " So is persistent undo ...
  set undolevels=1000         " Maximum number of changes that can be undone
  set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

" set cursorline                  " Highlight current line
highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode
highlight clear CursorLineNr    " Remove highlight color fromcurrent line number

set showmode                    " Display the current mode

if has('statusline')
  set laststatus=2

  " Broken down into easily includeable segments
  set statusline=%<%f\                     "Filename
  set statusline+=%w%h%m%r                " Options
  if !exists('g:override_spf13_bundles')
    set statusline+=%{fugitive#statusline()} " Git Hotness
  endif
  set statusline+=\[%{&ff}/%Y] "Filetype
  set statusline+=\[%{getcwd()}] "Current dir
  set statusline+=%=%-14.(%l,%c%V%)\%p%% "Right aligned file nav info
endif

set linespace=0 "No extra spaces between rows
set number "Line numbers on
set showmatch "Show matching brackets/parenthesis
set incsearch "Find as you type search
set hlsearch "Highlight search terms
set winminheight=0 "Windows can be 0 line high
set ignorecase "Case insensitive search
set smartcase "Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set foldmethod=indent
" check one time after 4s of inactivity in normal mode
set autoread
au CursorHold * checktime

" SnipMate
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
