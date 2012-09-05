set nocompatible
filetype off
if has("win32")
	set rtp+=~/vimfiles/bundle/vundle/
  call vundle#rc("~/vimfiles/bundle")
else
	set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
endif


Bundle 'gmarik/vundle'
Bundle 'rodjek/vim-puppet'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'majutsushi/tagbar'
Bundle 'matchit.zip'

filetype plugin indent on

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
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=\ %{fugitive#statusline()}     " fugitive
set statusline+=%=                           " right align remainder
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position
set relativenumber

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

let mapleader = ','
let maplocalleader = ','

let g:Powerline_stl_path_style = 'filename'

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
map <leader>r  :call NumberToggle()<cr>

if (&term == 'xterm')
    set t_Co=256
endif

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("gui_gtk2")
  set guifont=Anonymous\ Pro\ 14
endif

if has("gui_win32")
    set guifont=Consolas:h14
endif

if has("gui_running")
  colorscheme twilight
else
  colorscheme twilight256
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
