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

call plug#end()


"
" Basic configuration
"

" Set space as leader
let mapleader = "\<Space>" 
" Prevent space from move in Normal and Visual mode
noremap <SPACE> <Nop>


"
" Color scheme
"
colorscheme monokai

"
" NERDTree
"
autocmd vimenter * NERDTree
map <leader>pt :NERDTreeToggle<CR>

