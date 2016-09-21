au VimEnter * set laststatus=2
autocmd BufEnter * lcd %:p:h
ca mru MRU
cnoremap <C-F5> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
cnoremap <F5> <C-R>=strftime("%Y%m%d %H%M%S")<CR>
colorscheme desert
ia c_ c_str()
imap <C-F> <C-X><C-F>
inoremap <C-F5> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
inoremap <F5> <C-R>=strftime("%Y%m%d %H%M%S")<CR>
let MRU_Max_Entries = 5000
map <C-E><C-W> :set wrap! lbr<CR>
map <C-F4> :bd<CR>
map <C-H> :exe "ptjump " . expand("<cword>")<CR>
map <C-Insert> "+y
map <C-J> :tnext<CR>
map <C-K> <C-]>
map <C-N> :enew<CR>
map <C-S-tab> :bp<CR>
map <C-Space> :!
map <C-Z> :buffers<CR>:buffer<Space>
map <C-_> "syiw:vimg /\<<C-R>s\>/ 
map <C-tab> :bn<CR>
map <Esc> :pclose<CR>
map <F12> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
map <F5> :cd %:p:h<CR>
map <F7> :set makeprg=devenv\ %\ /build\ Debug<CR>
map <F8> :cn<CR>
map <Leader>a :e ++enc=latin1<CR>
map <Leader>u :e ++enc=utf-8<CR>
map <S-Del> "+d
map <S-F5> :!ctags --tag-relative=yes --recurse --c++-kinds=+p --python-kinds=-i --fields=+iaS --extra=+q<CR>
map <S-F7> :set makeprg=msbuild\ /nologo\ /v:q\ /property:GenerateFullPaths=true\ %<CR>
map <S-F8> :cp<CR>
map <S-Insert> "+p
map <Space> :
map <tab> :b #<CR>
nmap j gj
nmap k gk
nnoremap <C-Left> g-<CR>
nnoremap <C-PageDown> :if &go=~#'b'<Bar>set go-=b<Bar>else<Bar>set go+=b<Bar>endif<CR>
nnoremap <C-PageUp> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
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
set errorformat=%f(%l)%m
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
set makeprg=msbuild\ /nologo\ /v:q\ /property:GenerateFullPaths=true
set nocompatible
set nrformats=hex
set number
set path=.
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

