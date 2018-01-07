set nocompatible
set encoding=utf-8   " Use UTF-8 encoding
set nobackup         " Don't backup
set nowritebackup    " Write file in place
set noswapfile       " Don't use swap files (.swp)
set autoread         " Autoreload buffers
set autowrite        " Automatically save changes before switching buffers
syntax enable        " Enable syntax highlight

filetype off

" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-bundler.git'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'vim-airline/vim-airline'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

call vundle#end()            " required
filetype plugin indent on    " required

" History, Cursor, Rulers
set history=50    " Just remember last 50 commands
set laststatus=2  " Always display the status line
set ruler         " Show the cursor position all the time
set number        " Show line numbers
set showcmd       " Display incomplete commands
set shell=$SHELL  " Default shell is ZSH
set winwidth=80   " Force windows to eb 80 char wide
set undofile      " Persistent undo (across files)
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Tabs and whitespaces
set tabstop=2                     " Tabs are always 2 spaces
set expandtab                     " Expand tabs into spaces
set shiftwidth=2                  " Reindent with 2 spaces (using <<)
set list                          " Show invisible chars
set listchars=""                  " Reset listchars
set list listchars=tab:»·,trail:· " Set listchars for tabs and trailing spaces

" Search
set hlsearch    " Highlight matches
set incsearch   " Incremental searching
set ignorecase  " Searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

"Replace
set gdefault    " the /g flag on :s substitutions by default

" Apparence
" colorscheme Tomorrow-Night   " Tomorrow Night is the theme of choice
" Unified color scheme (default: dark)
set background=dark
colorscheme deep-space
set linespace=2
let g:airline_theme='deep_space'

" Rspec Vim
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rspec_runner = "os_x_iterm2"
let g:rspec_command = "spring rspec {spec}"

" CtrlP
let g:ctrlp_map = '<c-t>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" remove trailing whitespace
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    let _s=@/
    keepjumps :%s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfun
augroup barber
    au!
    au BufWritePre * :call <SID>StripTrailingWhitespaces()
augroup END

" less annoyances
:command! W w
:command! Q q
