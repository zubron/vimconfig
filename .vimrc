" generic preferences
syntax enable
set nu
set t_Co=256
set background=dark
set expandtab
set shiftwidth=4
set softtabstop=4

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

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

" Awesomeness ahead
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate'

"Indent highlighting
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
if has("autocmd")
    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
endif

" Delete trailing whitespace
autocmd FileType python,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e
