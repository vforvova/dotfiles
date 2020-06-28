" made according to https://github.com/dideler/dotfiles/blob/master/.vimrc
" For help, in Vim type `:help <topic>`.

set nocompatible " Don't need to be compatible with Vi at the expense of Vim.
set shell=sh " Vim assumes your shell is sh compatible and fish-shell isn't.

" Download vim-plug if missing.
if !filereadable(expand("~/.vim/autoload/plug.vim"))
  silent !echo 'Installing vim-plug...'
  !curl -fLo ~/.vim/autoload/plug.vim --progress-bar --create-dirs
     \  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let s:bootstrap=1
endif

" vim-plug usage
" :PlugInstall                 - install plugins
" :PlugUpdate                  - install or update plugins
" :PlugDiff                    - see updated changes from last PlugUpdate
" :PlugUpgrade                 - upgrade vim-plug itself
" :PlugStatus                  - check the status of plugins
" :PlugSnapshot [output path]  - generate script to restore current snapshot
" :PlugClean(!)                - (force) remove unused plugins


"
" Plugin list
"
call plug#begin()

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sheerun/vim-polyglot'
Plug 'sickill/vim-monokai'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Valloric/YouCompleteMe'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-signify'

call plug#end()

"
" Basic configuration
"

" Set space as leader
let mapleader = "\<Space>" 
" Prevent space from move in Normal and Visual mode
noremap <SPACE> <Nop>

filetype on
filetype plugin on
filetype indent on

set modifiable
set smartindent
set autoindent

" Organize swapfiles
set directory^=$HOME/.vim/tmp//

" Switch between buffers without saving
set hidden

" Enable line numbers
set number

" Highlight search
set hlsearch

" Enable folding
set foldenable

" Show ruler
set ruler

" Tab size
set tabstop=2
set shiftwidth=2

" Tab to spaces
set expandtab

" Folding
set foldmethod=indent
set foldcolumn=1
set foldlevelstart=99

" Source the .vimrc after saving it
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif


"
" Color scheme
"
colorscheme monokai

"
" NERDTree
"
autocmd vimenter * NERDTree
map <leader>pt :NERDTreeToggle<CR>

" Close NERDTree automatically
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"
" Completion
"

"
" TabNine
"
set rtp+=~/tabnine-vim

"
" Go
"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

