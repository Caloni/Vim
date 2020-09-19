autocmd BufEnter * lcd %:p:h " change the local current directory every time enters another buffer
ca mru MRU " using MRU plugin that searches for all files opened before using wildcards
let MRU_Max_Entries = 50000 " max entries for plugin MRU
map <C-E><C-W> :set wrap! lbr<CR> " toogle word wrap for long lines using visual studio shortcut (with 'breakat' activated intead of last character before the break)
map <C-F4> :bd<CR> " delete current buffer (to delete all buffers except current one: %bd|e#)
map <C-H> :exe "ptjump " . expand("<cword>")<CR> " select a tag and open in a preview window
map <C-J> :tnext<CR> " navigates thru the duplicated tags
map <C-K> <C-]> " go to definition
map <C-L> :exe "tselect " . expand("<cword>")<CR> " select a tag before navigating to definition
map <C-S-tab> :bp<CR> " go to the previous buffer
map <C-Space> :!  " map command mode c-space to colon (:) signal with exclamation to execute something
map <C-Z> :buffers<CR>:buffer<Space> " list all opened buffers and open the prompt to select one
map <C-tab> :bn<CR> " go to the next buffer
map <Esc> :pclose<CR> " closes the preview window
map <Leader>d "+d " delete to the system register instead of the anonymous one (_) warn: not working in terminal vim
map <Leader>p "+p " insert from the system register instead of the anonymous one (_) warn: not working in terminal vim
map <Leader>y "+y " yank to the system register instead of the anonymous one (_) warn: not working in terminal vim
map <Space> : " map command mode space to almost used colon (:) signal
map <tab> :b #<CR> " go to the last buffer in navegation history
set autoindent " obvious
set backspace=indent,eol,start " allow backspace over autoindent, line breaks and start of insert
set cino=t0 " changes the way c is indented
set cmdheight=2 " avoid to see too much press Enter after executing external commands
set complete=.,b,t " how the autocomplete works
set directory=.,$TEMP " directories where to create the swap file (avoids trying to edit read only directory and access errors)
set display+=lastline " how displays the text
set encoding=utf8 " the encoding displayed
set expandtab " use the appropriate numbers of spaces to insert a <tab>
set fileencoding=utf8 " the encoding written to file
set hidden " keep the buffer hidden when abandoned
set hlsearch " hightlight the last search; nohls disabled and :noh disable only until new search
set ignorecase " ignore case in search patterns
set incsearch " incremental search
set number " print number line in front of lines
set ruler " obvious ?
set shiftround " round indent of multiple of shiftwidht
set shiftwidth=4 " number of spaces to use for each step of (auto)indent
set showfulltag " c completion related option
set smartcase " override ignorecase option if there is case in the search
set smarttab " indent related option
set softtabstop=4 " feeling like insert all spaces, but is really mixing up (dependent on expandtab and others)
set statusline+=%m " statusline options:
set statusline+=%n
set statusline+=\ %=
set statusline+=\ %F
set statusline+=\ %P
set statusline+=\ %l,%c
set tabstop=4 " number of spaces that a <tab> counts for
set tags=tags; " the tags files to search for
set undodir=$VIM/vimfiles/undo " undo related options
set undofile
set undolevels=1000
set undoreload=10000
set ve=block " working in visual mode to select columns where it is empty
set visualbell " visual bell instead of an actual bell
set wildmenu " enhanced the completion menu
set wrap lbr " wrap lines and break in words, not chars
if has("gui_running")
    " use gvimfullscreen.dll if available to toggle full screen
    map <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
    set guifont=Consolas:h13 " hide the mouse when typing
    set mousehide " remove toolbar
    set guioptions-=T " remove menu
    set guioptions-=m " remove right scroll bar
    set guioptions-=r " syntax on is needed to au GUIEnter bellow; otherwise will generate menu.vim error
    syntax on " when entering the gui successfully simulate alt key (:simalt) with space (~) and x; this would full screen the window
    au GUIEnter * simalt ~x " back to syntax off; warn: we do not know if was on before
    syntax off " shortcut F4 retired; just use !start .
    " increase font size
    nnoremap <C-Up> :silent! let &guifont = substitute(
            \ &guifont,
            \ ':h\zs\d\+',
            \ '\=eval(submatch(0)+1)',
            \ '')<CR>
    " decrease font size
    nnoremap <C-Down> :silent! let &guifont = substitute(
            \ &guifont,
            \ ':h\zs\d\+',
            \ '\=eval(submatch(0)-1)',
            \ '')<CR>
    colorscheme paramount " color scheme for graphic vim
endif
