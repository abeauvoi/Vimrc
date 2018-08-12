" Autoload Plugin-Manager
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin manager ("https://github.com/junegunn/vim-plug")
call plug#begin('~/.vim/bundle')
Plug 'pbondoer/vim-42header'
Plug 'valloric/youcompleteme'
Plug 'nlknguyen/papercolor-theme'
call plug#end()

" Enable file type detection. Use the default filetype settings.
" Also load indent files, to automatically do language-dependent indenting.
" Keep this up here, because load order ("https://vi.stackexchange.com/a/8832")
filetype plugin on
filetype indent on

"-------------------------------------------------------------------------------
" Various settings
"-------------------------------------------------------------------------------
set autoindent                  " copy indent from current line
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next ,...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set browsedir=current           " which directory to use for the file browser
set history=50                  " keep 50 lines of command line history
set incsearch                   " do incremental searching
set ruler                       " show the cursor position all the time
set shiftwidth=4                " number of spaces to use for each step of indent
set showcmd                     " display incomplete commands
set smartindent                 " smart autoindenting when starting a new line
set tabstop=4                   " number of spaces that a <Tab> counts for
set visualbell                  " visual bell instead of beeping
set wildmenu                    " command-line completion in an enhanced mode
set nocompatible 				" disable vi compatibility (emulation of old bugs)
set t_Co=256					" turn syntax highlighting on
set lazyredraw
set showmatch 					" Show matching bracket, parenthesis, etc.
set number						" Show line number
set dir=~/.vim/swap				" where to store .swp files
" Colorscheme
colorscheme papercolor
set background=dark
syntax on
" set UTF-8 encoding
" set enc=utf-8
" set fenc=utf-8
" set termencoding=utf-8
"-------------------------------------------------------------------------------
"  Move current line up or down by 1
"-------------------------------------------------------------------------------
nnoremap - :m.+1<CR>==
nnoremap _ :m.-2<CR>==
"-------------------------------------------------------------------------------
"  some additional hot keys
"-------------------------------------------------------------------------------
"    F2   -  write file without confirmation
"    F3   -  call file explorer Ex
"    F5   -  open quickfix error window
"    F6   -  close quickfix error window
"    F7   -  display previous error
"    F8   -  display next error
nnoremap <silent> <F2> :w<CR>
nnoremap <silent> <F3> :Explore<CR>
nnoremap <silent> <F5> :copen<CR>
nnoremap <silent> <F6> :cclose<CR>
nnoremap <silent> <F7> :cp<CR>
nnoremap <silent> <F8> :cn<CR>
"
inoremap <silent> <F2> <ESC>:w<CR>i
inoremap <silent> <F3> <ESC>:Explore<CR>
inoremap <silent> <F5> <ESC>:copen<CR>
inoremap <silent> <F6> <ESC>:cclose<CR>
inoremap <silent> <F7> <ESC>:cp<CR>
inoremap <silent> <F8> <ESC>:cn<CR>
"-------------------------------------------------------------------------------
" Fast switching between buffers
" The current buffer will be saved before switching to the next one.
" Choose :bprevious or :bnext
"-------------------------------------------------------------------------------
noremap  <silent> <s-tab>       :if &modifiable && !&readonly && 
			\ &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
inoremap  <silent> <s-tab>  <C-C>:if &modifiable && !&readonly &&
			\                      &modified <CR> :write<CR>:endif<CR>:bprevious<CR>
"-------------------------------------------------------------------------------
" Leave the editor with Ctrl-q : Write all changed buffers and exit Vim
"-------------------------------------------------------------------------------
nnoremap  <C-q>    :wqall<CR>
"-------------------------------------------------------------------------------
" Rebind switch splits
"-------------------------------------------------------------------------------
noremap <Up> <C-w><Up>
noremap <Down> <C-w><Down>
noremap <Right> <C-w><Right>
noremap <Left> <C-w><Left>
"-------------------------------------------------------------------------------
" Search and replace over entire buffer
"-------------------------------------------------------------------------------
nnoremap ;; :%s:::g<Left><Left><Left>
"-------------------------------------------------------------------------------
" map <esc> to <jk>
"-------------------------------------------------------------------------------
inoremap jk <ESC>
inoremap <ESC> <NOP>
"-------------------------------------------------------------------------------
" Disable arrow keys in insert mode
"-------------------------------------------------------------------------------
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Right> <NOP>
inoremap <Left> <NOP>
