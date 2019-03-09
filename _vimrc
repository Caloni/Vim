" change the local current directory every time enters another buffer
autocmd BufEnter * lcd %:p:h
" using MRU plugin that searches for all files opened before using wildcards
ca mru MRU
" max entries for plugin MRU
let MRU_Max_Entries = 50000
" toogle word wrap for long lines using visual studio shortcut (with 'breakat' activated intead of last character before the break)
map <C-E><C-W> :set wrap! lbr<CR>
" list all opened buffers and open the prompt to select one
map <C-Z> :buffers<CR>:buffer<Space>
" delete current buffer (to delete all buffers except current one: %bd|e#)
map <C-F4> :bd<CR>
" shortcut c-h excluded; use :ptj tag to select a tag and open in a preview window
" yank to the system register instead of the anonymous one (_) warn: not working in terminal vim
map <Leader>y "+y
" shortcuts c-k and c-j excluded; the c-] is working (old c-k) and :tn navigates thru the duplicated tags)
" shortcut C-G excluded; use 1C-G to see full path for the current file
" go to the previous buffer
map <C-S-tab> :bp<CR>
" map command mode c-space to colon (:) signal with exclamation to execute something
map <C-Space> :!
" go to the next buffer
map <C-tab> :bn<CR>
" shortcut <F5> retired; use :cd %:p:h to set current dir for all buffers, :lcd to only the current buffer
" delete to the system register instead of the anonymous one (_) warn: not working in terminal vim
map <Leader>d "+d
" insert from the system register instead of the anonymous one (_) warn: not working in terminal vim
map <Leader>p "+p
" map command mode space to almost used colon (:) signal
map <Space> :
" go to the last buffer in navegation history
map <tab> :b #<CR>
" shortcuts c-pagedown and c-pageup retired; search for set guioptions/go for handle it
" indent automatically new line accordingly with the current one
set autoindent
" changes the way c is indented
set cino=t0
" avoid to see too much press Enter after executing external commands
set cmdheight=2
" how the autocomplete works
set complete=.,b,t
" directories where to create the swap file (avoids trying to edit read only directory and access errors)
set directory=.,$TEMP
" how displays the text
set display+=lastline
" use the appropriate numbers of spaces to insert a <tab>
set expandtab
" keep the buffer hidden when abandoned
set hidden
" hightlight the last search; nohls disabled and :noh disable only until new search
set hlsearch
" ignore case in search patterns
set ignorecase
" incremental search
set incsearch
" what number formats to consider to increment
"set nrformats=hex
" print number line in front of lines
set number
" if you want to navigate thru files outside the current dir use set path=.,<other-dirs> (using / slash for path)
"sshow the coordinates for the cursor
set ruler
" round indent of multiple of shiftwidht
set shiftround
" number of spaces to use for each step of (auto)indent
set shiftwidth=4
" c completion related option
set showfulltag
" override ignorecase option if there is case in the search
set smartcase
" indent related option
set smarttab
" feeling like insert all spaces, but is really mixing up (dependent on expandtab and others)
set softtabstop=4
" statusline options
set statusline+=%m
set statusline+=%n
set statusline+=\ %=
set statusline+=\ %F
set statusline+=\ %P
set statusline+=\ %l,%c
" number of spaces that a <tab> counts for
set tabstop=4
" the tags files to search for
set tags=tags;
" undo related options
set undodir=$VIM/vimfiles/undo
set undofile
set undolevels=1000
set undoreload=10000
" working in visual mode to select columns where it is empty
set ve=block
" visual bell instead of an actual bell
set visualbell
" enhanced the completion menu
set wildmenu
" wrap lines and break in words, not chars
set wrap lbr
" the encoding displayed
set encoding=utf8
" the encoding written to file
set fileencoding=utf8
" allow backspace over autoindent, line breaks and start of insert
set backspace=indent,eol,start

if has("gui_running")
    set guifont=Consolas:h13
    " hide the mouse when typing
    set mousehide
    " remove toolbar
    set guioptions-=T
    " remove menu
    set guioptions-=m
    " remove right scroll bar
    set guioptions-=r
    " syntax on is needed to au GUIEnter bellow; otherwise will generate menu.vim error
    syntax on
    " when entering the gui successfully simulate alt key (:simalt) with space (~) and x; this would full screen the window
    au GUIEnter * simalt ~x
    " back to syntax off; warn: we do not know if was on before
    syntax off
    " shortcut F4 retired; just use !start .
endif

colorscheme matrix
