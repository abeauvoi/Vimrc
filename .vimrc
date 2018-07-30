" Autoload Plugin-Manager
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Plugins
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/bundle')
Plug 'pbondoer/vim-42header'
Plug 'valloric/youcompleteme'
Plug 'raimondi/delimitmate'
call plug#end()
" Options
syntax enable
colorscheme badwolf
set wildmenu
set lazyredraw
set showmatch
set noshowcmd
set number
set dir=~/.vim/swap
set hlsearch

" DelimitMate ("https://github.com/Raimondi/delimitMate")
au Filetype c,h let b:delimitMate_autoclose = 1 

" Highlight groups
highlight ExtraWhitespace ctermbg=white
autocmd BufEnter *.c,h match ExtraWhitespace /\s\+$/
autocmd BufEnter *.c,h match ExtraWhitespace /^\(\/\*\)\@!.*\zs \{2,}\ze/
autocmd InsertEnter *.c,h match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertEnter *.c,h match ExtraWhitespace /^\(\/\*\)\@!.*\zs \{2,}\ze/
autocmd InsertLeave *.c,h match ExtraWhitespace /\s\+$/
autocmd InsertLeave *.c,h match ExtraWhitespace /^\(\/\*\)\@!.*\zs \{2,}\ze/
" Mappings
" Move current line upwards
nnoremap - :m.+1<CR>==
" Move current line downwards
nnoremap _ :m.-2<CR>==
" Enter search and replace mode
nnoremap ;; :%s:::g<Left><Left><Left>
" Disable esc
inoremap jk <ESC>
inoremap <ESC> <Nop>
" Disable arrow keys in insert mode 
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>
inoremap <Left> <Nop>
" Use instead to switch windows
noremap <Up> <C-w><Up>
noremap <Down> <C-w><Down>
noremap <Right> <C-w><Right>
noremap <Left> <C-w><Left>
