" Sections:
"    -> Vundle
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"
"
"''''''''''''''''''''''''''''''''
"  => Vundle
"'''''''''''''''''''''''''''''''
"
set nocompatible              " be iMproved, required
filetype off                  " required

set history=10000

" set the runtime path to include Vundle and initialize
if has("win32")
	set rtp+=~/vimfiles/bundle/Vundle.vim/
	let path='~/vimfiles/bundle'
	call vundle#begin(path)
else
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
endif
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'yegappan/mru'

"zencoding
Plugin 'mattn/emmet-vim'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/taglist.vim'

" lisp liked languages
Plugin 'vim-scripts/paredit.vim'
Plugin 'kien/rainbow_parentheses.vim'
" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'

Plugin 'elzr/vim-json'

Plugin 'tomtom/tcomment_vim'

Plugin 'docunext/closetag.vim'

Plugin 'Raimondi/delimitMate'

Plugin 'scrooloose/syntastic'

Plugin 'majutsushi/tagbar'

" Snippet engine
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required

""" plugin configuration settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""" if you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"'''''''''''''''''''''''''''''
" => Vim Interface
"'''''''''''''''''''''''''''''
set autoread
set wildmenu

set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set ruler
set cmdheight=2
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw

" For regular expressions
set magic
set showmatch
set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set foldcolumn=1
set number
set relativenumber

"'''''''''''''''''''''''''''''''''''''''''''''''''
" => Colors and Fonts
"'''''''''''''''''''''''''''''''''''''''''''''''''
syntax enable
try
	colorschem desert
catch
endtry

set background=dark

" set extra options when running in GUI mode
if has("gui_running")
	set guioptions-=T
	set guioptions-=e
	set t_Co=256
	set guitablabel=%M\ %t
endif

set encoding=utf8

set ffs=unix,dos,mac

"''''''''''''''''''''''''''''''''''''''''''
" => File and backup
"''''''''''''''''''''''''''''''''''''''''''
" Turn backup off, since most stuff is in SVN, git etc.
"set nobackup
"set nowb
"

"'''''''''''''''''''''''''''''''''''''''''''
" => Text, tab and indent related 
"'''''''''''''''''''''''''''''''''''''''''''
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
" '''''''''''''''''''''''''''''''''''''''''''''
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelect('f','')<CR>
vnoremap <silent> # :call VisualSelect('b','')<CR>


""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
" '''''''''''''''''''''''''''''''''''''''''''''
" Treat long lines as break lines (useful when moving around in them)
"
" Specify the behavior when switing between buffers
try 
	set switchbuf=useropen,usetab,newtab
	set stal=2
catch
endtry

" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") >0 && line("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif

" Remember info about open bufers on close
set viminfo^=%

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
"
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow parenthese
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable rainbow parentheses for all buffers
augroup rainbow_parentheses
    au!
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
augroup end

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
""""""""""""""""""""""""""""
" => Helper functions
""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif
    
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste 
        return 'PASTE MODE '
    endif
    return ''
endfunction
