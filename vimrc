" Sections:
"    -> Neobundle
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
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let $PATH = '-DPYTHON_INCLUDE_DIR=/usr/lib/python2.7'.$PATH
""" NeoBundle configuration settings
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""" if you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

runtime macros/matchit.vim

" set the runtime path to include neobundle and initialize
" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

" alternatively, pass a path where Vundle should install NeoBundles
"call vundle#begin('~/some/path/here')

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'Shougo/vimshell.vim'

" The following are examples of different formats supported.
" Keep NeoBundle commands between vundle#begin/end.
" NeoBundle on GitHub repo
NeoBundle 'tpope/vim-fugitive'
" NeoBundle from http://vim-scripts.org/vim/scripts.html
NeoBundle 'L9'
" Git NeoBundle not hosted on GitHub
NeoBundle 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own NeoBundle)
" NeoBundle 'file:///home/gmarik/path/to/NeoBundle'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-bundler'

" Text objects for the last searched pattern
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-lastpat'


NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'michaeljsmith/vim-indent-object'
NeoBundle 'yegappan/mru'

NeoBundle 'Shougo/unite.vim'

"zencoding
NeoBundle 'mattn/emmet-vim'
NeoBundle 'bling/vim-airline'

" lisp liked languages
NeoBundle 'vim-scripts/paredit.vim'
NeoBundle 'kien/rainbow_parentheses.vim'
" Clojure
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-classpath'
NeoBundle 'guns/vim-clojure-highlight'

"Go
NeoBundle 'fatih/vim-go'

NeoBundle 'elzr/vim-json'

"ruby & rails
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'

NeoBundle 'tomtom/tcomment_vim'

NeoBundle 'docunext/closetag.vim'

NeoBundle 'jiangmiao/auto-pairs'

NeoBundle 'scrooloose/syntastic'

NeoBundle 'majutsushi/tagbar'

NeoBundle 'sjl/gundo.vim'


NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'kchmck/vim-coffee-script'
" Snippet engine
NeoBundle 'SirVer/ultisnips'

NeoBundle 'sjl/gundo.vim'

NeoBundle 'plasticboy/vim-markdown'

" Snippets are separated from the engine. Add this if you want them:
NeoBundle 'honza/vim-snippets'

NeoBundle 'nelstrom/vim-qargs'
NeoBundle 'nelstrom/vim-visual-star-search'


" All of your NeoBundles must be added before the following line
call neobundle#end()            " required


filetype plugin indent on    " required
" To ignore NeoBundle indent changes, instead use:
filetype plugin on
"
" Brief help
" :NeoBundleList          - list configured NeoBundles
" :NeoBundleInstall(!)    - install (update) NeoBundles
" :NeoBundleSearch(!) foo - search (or refresh cache first) for foo
" :NeoBundleClean(!)      - confirm (or auto-approve) removal of unused NeoBundles
"
" see :h vundle for more details or wiki for FAQ
" Put your non-NeoBundle stuff after this line
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
set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber 

"'''''''''''''''''''''''''''''''''''''''''''''''''
" => Colors and Fonts
"'''''''''''''''''''''''''''''''''''''''''''''''''
syntax enable
try
	colorschem mustang
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
vnoremap <silent> . :norm.<CR>


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
" Evaluate Clojure buffers on load
autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry
" autocmd Syntax  clojure EnableSyntaxExtension

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

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
