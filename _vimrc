au VimEnter * set laststatus=2
autocmd BufEnter * lcd %:p:h
" using MRU plugin that searches for all files opened before using wildcards
ca mru MRU
" max entries for plugin MRU
let MRU_Max_Entries = 5000
" toogle word wrap for long lines using visual studio shortcut (with 'breakat' activated intead of last character before the break)
map <C-E><C-W> :set wrap! lbr<CR>
" delete current buffer (to delete all buffers except current one: %bd|e#)
map <C-F4> :bd<CR>
" shortcut c-h excluded; use :ptj tag to select a tag and open in a preview window
" yank to the system register instead of the anonymous one (_) warn: not working in terminal vim
map <C-Insert> "+y
" shortcuts c-k and c-j excluded; the c-] is working (old c-k) and :tn navigates thru the duplicated tags)
" shortcut C-G excluded; use 1C-G to see full path for the current file
" go to the previous buffer
map <C-S-tab> :bp<CR>
" map command mode c-space to colon (:) signal with exclamation to execute something
map <C-Space> :!
" go to the next buffer
map <C-tab> :bn<CR>
map <Esc> :pclose<CR>
map <F5> :cd %:p:h<CR>
map <F7> :set makeprg=devenv\ %\ /build\ $Config<CR>
map <F8> :cn<CR>
" reopen the buffer using specific encoding (a for ascii, u for unicode)
map <Leader>a :e ++enc=latin1<CR>
map <Leader>u :e ++enc=utf-8<CR>
" delete to the system register instead of the anonymous one (_) warn: not working in terminal vim
map <S-Del> "+d
map <S-F7> :set makeprg=msbuild\ /nologo\ /v:q\ /property:GenerateFullPaths=true\ /p:Configuration=$Config\ /p:Platform=$Platform\ %<CR>
map <S-F8> :cp<CR>
" insert from the system register instead of the anonymous one (_) warn: not working in terminal vim
map <S-Insert> "+p
" map command mode space to almost used colon (:) signal
map <Space> :
" go to the last buffer in navegation history
map <tab> :b #<CR>
nmap j gj
nmap k gk
nnoremap <C-Left> g-<CR>
nnoremap <C-PageDown> :if &go=~#'b'<Bar>set go-=b<Bar>else<Bar>set go+=b<Bar>endif<CR>
nnoremap <C-PageUp> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
map <C-CR> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
map <F12> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-Right> g+<CR>
set autochdir
set autoindent
set autowriteall
set background=dark
set backspace=2
set backup
set backupdir=$VIM/vimfiles/backup
set cino=t0
set cmdheight=2
set complete=.,b,t
set directory=.,$TEMP
set display+=lastline
set errorformat=%f(%l):\ %m
set expandtab
set exrc
set guitablabel=%t
set guitabtooltip=%F
set hidden
set history=100
set hlsearch
set ignorecase
set incsearch
set listchars=eol:¶,tab:›…,trail:_
let $Config = 'Debug'
let $Platform = 'x86'
set makeprg=msbuild\ /nologo\ /v:q\ /property:GenerateFullPaths=true\ /p:Configuration=$Config\ /p:Platform=$Platform\ %
set nocompatible
set nrformats=hex
set number
set path=.,c:\\Program\\\ Files\\\ (x86)\Microsoft\\\ Visual\\\ Studio\\2017\\Enterprise\\VC\\Tools\\MSVC\\14.10.24930\\include,c:/Libs/WinDDK/6001.18001/inc/**/
set printoptions=syntax:y
set ruler
set shiftround
set shiftwidth=4
set showfulltag
set smartcase
set smarttab
set softtabstop=4
set statusline +=%m
set statusline +=%n
set statusline +=\ %=
set statusline +=\ %F
set statusline +=\ %P
set statusline +=\ %l,%c
set statusline=
set tabstop=4
set tags=tags;
set undodir=$VIM/vimfiles/undo
set undofile
set undolevels=1000
set undoreload=10000
set ve=block
set viminfo='20,\"50
set visualbell
set wildmenu
set wrap lbr
syntax on

if exists('&selection')
  set selection=exclusive
endif

function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>

if has("gui_running")
    set guifont=Consolas:h13
    set mousehide
    set guioptions-=T
    set guioptions-=m
    set guioptions+=r
    au GUIEnter * simalt ~x
    if has("win32")
      :map <silent> <F4> :if expand("%:p:h") != ""<CR>:!start explorer.exe %:p:h<CR>:endif<CR><CR>
    endif
    nnoremap <C-Up> :silent! let &guifont = substitute(
            \ &guifont,
            \ ':h\zs\d\+',
            \ '\=eval(submatch(0)+1)',
            \ '')<CR>
    nnoremap <C-Down> :silent! let &guifont = substitute(
            \ &guifont,
            \ ':h\zs\d\+',
            \ '\=eval(submatch(0)-1)',
            \ '')<CR>
else
    if exists("+lines")
        set lines=50
    endif
    if exists("+columns")
        set columns=100
    endif
endif

colorscheme matrix
syntax off
