"General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"always display the status line
set laststatus=2

"cross platform yank, paste
set clipboard^=unnamed,unnamedplus

"keep indention of clipboard paste
set paste

"show the matching part of the pair for [] {} and ()
set showmatch

"set the background theme to dark
set background=dark

"enable all Python syntax highlighting features
"let python_highlight_all = 1

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
if &compatible
    set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')

    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('vim-airline/vim-airline')

    call dein#add('airblade/vim-gitgutter')

    call dein#add('https://gitlab.com/Lenovsky/nuake.git')

    call dein#add('janko-m/vim-test')

    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    let g:deoplete#enable_at_startup = 1

    let g:airline_theme='base16'
    let g:airline#extensions#tabline#enabled =1

    nnoremap <F4> :Nuake<CR>
    inoremap <F4> <C-\><C-n>:Nuake<CR>
    tnoremap <F4> <C-\><C-n>:Nuake<CR>

    call dein#end()
    call dein#save_state()
endif
