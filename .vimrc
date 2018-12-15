"General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"always display the status line
set laststatus=2

" clear all autocommands! (this comment must be on its own line)
autocmd!

" Show (partial) command in status line.
set showcmd

"cross platform yank, paste
set clipboard^=unnamed,unnamedplus

"keep indention of clipboard paste
set paste

"show the matching part of the pair for [] {} and ()
set showmatch

"set the background theme to dark
set background=dark

"enable all Python syntax highlighting features
let python_highlight_all = 1

"color scheme
set t_Co=256
colorscheme PaperColor

"true color support
set termguicolors

"showing all white spaces, tabs, etc
set list

"set netrw line numbers etc
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro' 

"change tab characters to pipe
set listchars=tab:\│\ ,trail:-,extends:>,precedes:<,nbsp:+

"open help with argument vertically positioned on the right
command! -nargs=1 H :vert bo help <args>

"open tig in new term vertical split
command! T :vsplit term://tig

" remove holding shift to enter command mode
nmap ; :
"Gvim Window options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('gui_running')
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
endif

"Navagating splits
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"moves cursor down a split
nnoremap <C-Down> <C-W><C-J> 
"moves cursor up a split
nnoremap <C-Up> <C-W><C-K>
"moves cursor right a split
nnoremap <C-Right> <C-W><C-L>
"moves cursor left a split
nnoremap <C-Left> <C-W><C-H>

"Buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ,n :bnext<cr>
nnoremap ,p :bprev<cr>

nnoremap ,b :ls<CR>:buffer<Space>

"LineNumbers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set line numbers
set number

"Key remapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"exit terminal mode neovim
tnoremap <Esc> <C-\><C-n>

"Syntax
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"enables syntax coloring based on filetype
syntax on

"Indenting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"default backspace behavior
set backspace=indent,eol,start

"enables loading of indent file for specific file types
filetype plugin indent on

"show existing tab with 4 spaces width
set tabstop=4

"when indenting with '>>', use 4 spaces width
set shiftwidth=4

"on pressing tab, insert 4 spaces
set expandtab

"Folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"enables code folding by defined commands (zf)* 
setlocal foldmethod=manual

"Searching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"highlights all search matches
set hlsearch

"changes search highlighting to lightblue
hi Search guibg=LightBlue

"Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"FZF searching support
set rtp+=/usr/local/opt/fzf
nnoremap ,` :FZF<CR>

"Environment
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"no gui 

if has('gui_running')
    "expand gvim window
    set lines=999 columns =999

    "highlight current line
    set cul

    "adjust color
    hi CursorLine term=none cterm=none ctermbg=3
endif

"Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

    Plug '~/.cache/dein/repos/github.com/Shougo/dein.vim'
    Plug 'Shougo/deoplete.nvim'

    Plug 'zchee/deoplete-jedi'

    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-airline/vim-airline'

    Plug 'vim-syntastic/syntastic'

    Plug 'airblade/vim-gitgutter'

    Plug 'https://gitlab.com/Lenovsky/nuake.git'

    Plug 'janko-m/vim-test'

    Plug 'vim-python/python-syntax'

    Plug 'tpope/vim-fugitive'

    Plug 'tpope/vim-surround'

    Plug 'fatih/vim-go'

    Plug 'rust-lang/rust.vim'

call plug#end()

" Nuake
nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>
let g:nuake_size = 0.75

" Airline
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled =1

" Deoplete
let g:deoplete#enable_at_startup = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
