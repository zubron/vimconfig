" generic preferences
syntax enable
set nu
set t_Co=256
set background=dark
set expandtab
set shiftwidth=4
set softtabstop=4
set mouse=a

let mapleader = ","
set nocompatible              " be iMproved, required
filetype on
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'wesQ3/vim-windowswap'

" Add more plugins here...
" Syntax for Dockerfile
Plugin 'ekalinin/Dockerfile.vim'

" JavaScript syntax
Plugin 'jelera/vim-javascript-syntax'

" Additional JavaScript magic
Plugin 'pangloss/vim-javascript'

Plugin 'marijnh/tern_for_vim'
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

" Rust syntax
Plugin 'rust-lang/rust.vim'

" Awesomeness ahead
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate'

" Additional fun things
Plugin 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>
Plugin 'klen/python-mode'

let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

Plugin 'davidhalter/jedi-vim'

Plugin 'rizzatti/dash.vim'

Plugin 'vim-scripts/taglist.vim'
Plugin 'majutsushi/tagbar'

noremap <leader>tb :TagbarToggle<cr>:TagbarTogglePause<cr>

"Indent highlighting
"
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1

" Git integration
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Airline settings
Plugin 'bling/vim-airline'
let g:airline_powerline_fonts=1
set laststatus=2
let g:airline_theme="lucius"

if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif

let g:airline_symbols.space = ' '
let g:airline_left_sep = '>'
let g:airline_left_alt_sep = ''
let g:airline_right_sep = '<'
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Syntax highlighting for jinja2 templates
Plugin 'Glench/Vim-Jinja2-Syntax'
au BufRead,BufNewFile *.j2 setfiletype jinja

" Autocompletion/navigation for Rust
Plugin 'racer-rust/vim-racer'
set hidden
let g:racer_cmd = "racer"
let $RUST_SRC_PATH="/Users/bridget/.rust/src/rustc-1.6.0/src"


" Colorschemes
Plugin 'ajh17/Spacegray.vim' 
Plugin 'altercation/vim-colors-solarized'
Plugin 'goatslacker/mango.vim'
Plugin 'morhetz/gruvbox'
Plugin 'jonathanfilip/vim-lucius'
Plugin '29decibel/codeschool-vim-theme'
Plugin 'tomasr/molokai'

" Make gVim colorschemes works in terminal Vim
Plugin 'godlygeek/csapprox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set omnifunc=syntaxcomplete#Complete
set omnifunc=csscomplete#CompleteCSS
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" colorscheme calls go after Plugin declarations
colorscheme gruvbox

" Approximate molokai colorscheme in terminal Vim
" let g:rehash256=1

" Close YCM help text after selection
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Use ibeam cursor in insert mode
" if has("autocmd")
"    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome”-terminal/profiles/Default/cursor_shape block
"endif

" Change cursor shape between insert and normal mode in iTerm2.app
" if $TERM_PROGRAM =~ "iTerm"
"     let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
"     let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
" endif

" Delete trailing whitespace
autocmd FileType python,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e
