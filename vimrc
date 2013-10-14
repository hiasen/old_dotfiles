" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

autocmd!
" Clear any existing autocommands...

" ================ General Config ====================

set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set helplang=en
set guifont=Monospace\ 11
set mouse=a                     "Enables mouse in vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" ================ Encoding ======================
set fileencodings=ucs-bom,utf-8,default,latin1
set encoding=utf-8
setglobal fileencoding=utf-8
set termencoding=utf-8

" =============== Keyboard shortcuts ===============

" Copy/past to/from clipboard with usual shortcuts
vmap <C-C> "+y
vmap <C-Insert> "+y
inoremap <S-Insert> <ESC>"+p`]a

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set shiftround
set softtabstop=4
set tabstop=4
set expandtab

filetype on
filetype plugin on
filetype indent on


" ================ Visual Aids ======================

syntax on             "Turn on syntax highlighting
set number            "Line numbers are good
set showmatch         "Show the matching parenthesis
set matchpairs+=<:>   "Match also for < and >
set hlsearch          "Highlight all mathces from search
set nowrap            "Don't wrap lines
set linebreak         "Wrap lines at convenient points

colorscheme ron

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·


" =============== Search & Replace ==================

" " make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase
"  show the `best match so far' as search strings are typed:
set incsearch
"End searches on quit
au VimEnter * nohls


" =============== Formating =========================

" normally don't automatically format `text' as it is typed, IE only do this
" " with comments, at 79 characters:
set formatoptions-=t
set textwidth=79


" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile


" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,*.pyc "stuff to ignore when tab completing
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=4         "Start scrolling when we're 4 lines away from margins
set sidescrolloff=8
set sidescroll=1


" ================ Statusbar =====================

set ruler                       "Gives position of cursor

" use "[RO]" for "[readonly]" to save space in the message line:
set shortmess+=r
"Nice statusbar [courtesy of Ciaranm]
 set laststatus=2
 set statusline=
 set statusline+=%-3.3n\                      " buffer number
 set statusline+=%f\                          " file name
 set statusline+=%h%m%r%w                     " flags
 set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
 set statusline+=%{&encoding},                " encoding
 set statusline+=%{&fileformat}]              " file format
 if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
     set statusline+=\ %{VimBuddy()}          " vim buddy
     endif
     set statusline+=%=                           " right align
     set statusline+=0x%-8B\                      " current char
     set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset


" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


" ================ Turn Off Swap Files ==============

"set noswapfile
"set nobackup
"set nowb


" =============== Cursor position storage ============
  " From Bram:
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " DF - Also do not do this if the file resides in the $TEMP directory,
  "      chances are it is a different file with the same name.
  " This comes from the $VIMRUNTIME/vimrc_example.vim file
  autocmd BufReadPost *
    \ if expand("<afile>:p:h") !=? $TEMP |
    \   if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g`\"" |
    \     let b:doopenfold = 1 |
    \   endif |
    \ endif
  " Need to postpone using "zv" until after reading the modelines.
  autocmd BufWinEnter *
    \ if exists("b:doopenfold") |
    \   unlet b:doopenfold |
    \   exe "normal zv" |
    \ endif 


