set nocompatible
colorscheme twilight

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'rodjek/vim-puppet'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-ruby/vim-ruby'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'majutsushi/tagbar'
"Bundle "myusuf3/numbers.vim"

filetype plugin indent on

set background=dark
set ts=2
set sw=2
set expandtab
set vb
set hidden
set number
set title
set wildmenu
set wildmode=list:longest
set ruler
set showcmd
set incsearch
set encoding=utf-8
set backup
set backupdir=~/.vimbackup//,/tmp//
set directory=~/.vimswaps//,/tmp//
set backspace=2
set laststatus=2

let mapleader = ','
let maplocalleader = ','

let g:Powerline_stl_path_style = 'full'

let g:tagbar_type_puppet = {
  \ 'ctagstype' : 'puppet',
  \ 'kinds'     : [
    \ 'c:class',
    \ 's:site',
    \ 'n:node',
    \ 'd:define',
    \ 'v:variable',
  \ ]
\}
let g:tagbar_autofocus = 1

map <right> :bn<cr>
map <left>  :bp<cr>
map <up>    :wincmd w<cr>
map <down>  :wincmd W<cr>
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>d  :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>t  :TagbarToggle<CR>

if (&term == 'xterm')
  set t_Co=256
endif
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("autocmd")
  filetype plugin indent on

  augroup vimrcEx
    au!

    autocmd FileType make     set noexpandtab
    autocmd FileType python   set noexpandtab
    autocmd FileType text setlocal textwidth=78
  augroup END

  au! BufRead,BufNewFile *.mkd   setfiletype mkd
  augroup mkd
    autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
  augroup END

endif
