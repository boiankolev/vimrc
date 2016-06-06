
"General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"always display the status line
set laststatus=2


"Gvim Window options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('gui_running')
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
	set guifont=Consolas:h10
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

"LineNumbers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
"set relativenumber

let g:rel_num_toggle = 1
function! NumberToggle()
  if(&relativenumber == 1)
    set number
    set relativenumber!
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

"function! PushNumMode()
"	if(&relativenumber == 0)
"		set number
"		let g:rel_num_toggle = 0
"
"	else
"		set relativenumber!
"		let g:rel_num_toggle = 1
"	endif
"endfunc
"
"function! PopGainNum()
"	if(g:rel_num_toggle == 1)
"		set relativenumber
"		let g:rel_num_toggle = 0
"	else
"		let g:rel_num_toggle = 1
"	endif
"endfunc

"au FocusLost * :call PushNumMode()
"au FocusGained * :call PopGainNum()

"autocmd InsertEnter * :call PushNumMode()
"autocmd InsertLeave * :call PopGainNum()

"Key remapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap K i<CR><Esc>

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

"Environment 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"no gui 
colors evening

if has('gui_running')
    "make a repo for the colors or pull from existing repo?	
    colors gruvbox
    "change to dark gruvbox theme	
    set background=dark
    
    "expand gvim window
	set lines=999 columns =999

	"highlight current line
	set cul
	
    "adjust color
	hi CursorLine term=none cterm=none ctermbg=3      
endif

"pyclewn
"let g:pyclewn_terminal="xterm, -e"
"let g:pyclewn_args="--window=right"

"map <Delete> :C s<CR>
"map <End> :C n<CR>
"map <PageDown> :C finish<CR>
"map <Insert> :C run<CR>
"map <Home> :C bt<CR>
"map <PageUp> :C continue<CR>

"abstract this later
"map <F2> :!./compile.sh<CR>


"autocmd VimEnter * :Pyclewn
"autocmd VimEnter * Cexitclewn

"let g:debug_mode=0

"need to abstract away entry point in the future
"function! DebugSwitch()
"      if(g:debug_mode == 0)
"		execute "Pyclewn gdb"
"		"execute "Cfile main"
"		"execute "Cstart"		
"		let g:debug_mode=1
"	else
"		execute "Cquit"
"		execute "C import sys; sys.exit(1)"
"		execute "Cexitclewn"
"		
"		let g:debug_mode=0
"	endif
"endfunction

"map <F3> :call DebugSwitch()<CR>


"Universal Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"pathogen
"nerdtree-master
"tcomment_vim
"vim-airline
"vim-dispatch *Not currently in use*

if has("gui_running")
    "start pathogen to load plugins	
    execute pathogen#infect()

    "auto starts nerdtree when vim is opened with a file	
    autocmd VimEnter * NERDTree

    "moves cursor from nerdtree to window of file opened
    autocmd VimEnter * wincmd p

    "closes vim if nerdtree is only window still open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    
    "toggles nerd tree off/on
    map <F12> :NERDTreeToggle<CR>
endif

"Windows Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"omnisharp-vim
"supertab
"syntastic *Not currently in use*
"vim-csharp
if has("gui_running")
    if has("win32")
        " OmniSharp won't work without this setting
        filetype plugin on

        "This is the default value, setting it isn't actually necessary
        let g:OmniSharp_host = "http://localhost:2000"

        "Set the type lookup function to use the preview window instead of the status line
        "let g:OmniSharp_typeLookupInPreview = 1

        "Timeout in seconds to wait for a response from the server
        let g:OmniSharp_timeout = 1

        "Showmatch significantly slows down omnicomplete
        "when the first match contains parentheses.
        set noshowmatch

        "Super tab settings - uncomment the next 4 lines
        let g:SuperTabDefaultCompletionType = 'context'
        let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
        let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
        let g:SuperTabClosePreviewOnPopupClose = 1

        "don't autoselect first item in omnicomplete, show if only one item (for preview)
        "remove preview if you don't want to see any documentation whatsoever.
        set completeopt=longest,menuone,preview
        " Fetch full documentation during omnicomplete requests.
        " There is a performance penalty with this (especially on Mono)
        " By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
        " you need it with the :OmniSharpDocumentation command.
        " let g:omnicomplete_fetch_documentation=1

        "Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
        "You might also want to look at the echodoc plugin
        set splitbelow

        " Get Code Issues and syntax errors
        let g:syntastic_cs_checkers = ['syntax', 'semantics', '']
        " If you are using the omnisharp-roslyn backend, use the following
        " let g:syntastic_cs_checkers = ['code_checker']
        augroup omnisharp_commands
            autocmd!

            "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
            autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

            " Synchronous build (blocks Vim)
            "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
            " Builds can also run asynchronously with vim-dispatch installed
            autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
            " automatic syntax check on events (TextChanged requires Vim 7.4)
            autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

            " Automatically add new cs files to the nearest project on save
            autocmd BufWritePost *.cs call OmniSharp#AddToProject()

            "show type information automatically when the cursor stops moving
            autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

            "The following commands are contextual, based on the current cursor position.

            autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
            autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
            autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
            autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
            autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
            "finds members in the current buffer
            autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
            " cursor can be anywhere on the line containing an issue
            autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
            autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
            autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
            autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
            "navigate up by method/property/field
            autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
            "navigate down by method/property/field
            autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

        augroup END


        " this setting controls how long to wait (in ms) before fetching type / symbol information.
        set updatetime=500
        " Remove 'Press Enter to continue' message when type information is longer than one line.
        set cmdheight=2

        " Contextual code actions (requires CtrlP or unite.vim)
        nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
        " Run code actions with text selected in visual mode to extract method
        vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

        " rename with dialog
        nnoremap <leader>nm :OmniSharpRename<cr>
        nnoremap <F2> :OmniSharpRename<cr>
        " rename without dialog - with cursor on the symbol to rename... ':Rename newname'
        command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

        " Force OmniSharp to reload the solution. Useful when switching branches etc.
        nnoremap <leader>rl :OmniSharpReloadSolution<cr>
        nnoremap <leader>cf :OmniSharpCodeFormat<cr>
        " Load the current .cs file to the nearest project
        nnoremap <leader>tp :OmniSharpAddToProject<cr>

        " (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
        nnoremap <leader>ss :OmniSharpStartServer<cr>
        nnoremap <leader>sp :OmniSharpStopServer<cr>

        " Add syntax highlighting for types and interfaces
        nnoremap <leader>th :OmniSharpHighlightTypes<cr>
        
        "Don't ask to save when changing buffers (i.e. when jumping to a type definition)
        set hidden
    endif
endif

"Unix Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    if has("unix")

    endif
endif

"Mac Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    if has("mac")
    
    endif
endif



