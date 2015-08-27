" Plugins to install
"
call plug#begin('~/.nvim/plugged')

" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Using git URL
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
"JSON Plugin
Plug 'elzr/vim-json'
" Install color schemes
Plug 'flazz/vim-colorschemes'
" Install vim-airline
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'edkolev/tmuxline.vim'
Plug 'scrooloose/syntastic'
Plug 'dougireton/vim-chef'
Plug 'benmills/vimux'
Plug 'jistr/vim-nerdtree-tabs'
call plug#end()

" Auto start NERDTree if vim is called with no arguments
function! StartUp()                                                                                                                                                                                         
    if 0 == argc()
	NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()

" Close NERDTree if it's the only and last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Open NERDTree files in tabs
"let NERDTreeMapOpenInTab='\r'
"let NERDTreeMapOpenInTab='<ENTER>'
let g:nerdtree_tabs_open_on_console_startup=1
" #### Basics #####
let mapleader=","
map <Leader>c :call VimuxRunCommand("clear; kitchen converge")<CR>
map <Leader>C :call VimuxPromptCommand("clear; kitchen converge ")<CR>
map <Leader>kl :call VimuxRunCommand("clear; kitchen list")<CR>
map <Leader>x :VimuxRunLastCommand<CR>
map <Leader>vq :VimuxCloseRunner<CR>

" Switch TABS to SPACES
set tabstop=2
set shiftwidth=2
set expandtab

" Set coloring syntax
syntax on
"colorscheme candy
"colorscheme gruvbox
colorscheme molokai 
"colorscheme darktango

" Folding
filetype plugin indent on
setlocal foldmethod=syntax
set foldlevel=2

" VIM HARD MODE
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set laststatus=2
let g:airline_powerline_fonts = 1
set noshowmode
let g:airline_theme='jellybeans'
"let g:airline_theme='powerlineish'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#syntastic#enabled = 1
let g:tmuxline_theme = 'zenburn'

" Syntastic
nmap <leader>sc :SyntasticCheck<CR>
nmap <leader>sr :SyntasticReset<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

"let g:syntastic_ruby_exec = ['foodcritic', 'mri']
let g:syntastic_ruby_checkers = ['foodcritic', 'mri']

let g:VimuxUseNearestPane = 1

