set nocompatible
set undolevels=1000
set autoindent
set smarttab
set ignorecase
set smartcase
set shiftwidth=4
set shiftround
set tabstop=4
set softtabstop=4
set expandtab
set nrformats=hex
let MRU_Max_Entries = 5000
set backspace=2
set exrc
set cino=t0
set autowriteall
set hidden
if exists('&selection')
  set selection=exclusive
endif
set incsearch
set hlsearch
set autochdir
set visualbell
set cmdheight=2
au VimEnter * set laststatus=2
set ruler
set viminfo='20,\"50
set path=.
map <C-E><C-W> :set wrap! lbr<CR>
set history=100
set number
set wildmenu
set tags=./tags,~/vim/tags/temp/tags,~/vim/tags/default/tags
set complete=.,b,t

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

map <C-Insert> "+y
map <S-Insert> "+p
map <S-Del> "+d
map <Space> :
map <C-Space> :!
map <S-Space> "syiw:%s/
vmap <S-Space> "sy:%s/
imap <C-Space> <C-C>
map <C-tab> :bn<CR>
map <C-S-tab> :bp<CR>
map <tab> :b #<CR>
map <S-tab> :tabNext<CR>
map <C-_> "syiw:vimg /\<<C-R>s\>/ 
vmap <C-_> "sy:vimg /\<<C-R>s\>/ 
map <C-L> "syiw/
vmap <C-L> "sy/
map <S-L> "syiw?
vmap <S-L> "sy?
imap <C-F> <C-X><C-F>
map <C-S> :w<CR>
map <C-K> <C-]>
map <C-J> :tnext<CR>
map <C-H> :exe "ptjump " . expand("<cword>")<CR>
map <Esc> :pclose<CR>
map <C-E><C-W> :set wrap! lbr<CR>
map <C-R><C-W> :set list!<CR>
map <C-T> :tabedit %<CR>
nnoremap <C-PageUp> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
nnoremap <C-PageDown> :if &go=~#'b'<Bar>set go-=b<Bar>else<Bar>set go+=b<Bar>endif<CR>
nnoremap <C-Left> g-<CR>
nnoremap <C-Right> g+<CR>
map <C-N> :enew<CR>
map <C-Z> :buffers<CR>:buffer<Space>

function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>

map <F1> di{{c1::<Esc>pa}}<Esc>F1
map <F3> :set hlsearch!<CR>
map <F5> :cd %:p:h<CR>
inoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>
cnoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>
map <F8> :cn<CR>
map <F12> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
map <C-F4> :bd<CR>
inoremap <C-F5> <C-R>=strftime("%y%m%d%H%M")<CR>
cnoremap <C-F5> <C-R>=strftime("%y%m%d%H%M")<CR>
map <C-F6> :w<CR>:A<CR>
map <Leader>a :e ++enc=latin1<CR>
map <Leader>u :e ++enc=utf-8<CR>
map <C-F12> :NextColorScheme<CR>
map <S-F1> T:d2F{f}2x
map <S-F5> :!ctagsauto %:p:h temp<CR>
inoremap <S-F5> <C-R>=strftime("%H:%M:%S")<CR>
map <S-F8> :cp<CR>
map <S-F12> :PrevColorScheme<CR>
set backup
set backupdir=~\Vim\backup
set undodir=~\Vim\undo
set undofile
set undolevels=1000
set undoreload=10000
set listchars=eol:¶,tab:›…,trail:_
set showfulltag
set display+=lastline
set printoptions=syntax:y
set ve=block
set wrap lbr
autocmd BufEnter * lcd %:p:h
set statusline=
set statusline +=%n
set statusline +=\ %F
set statusline +=%m
set statusline +=\ %=
set statusline +=\ %l,%c
set statusline +=\ %P
set guitablabel=%t
set guitabtooltip=%F
ia c_ c_str()
ca mru MRU
nmap j gj
nmap k gk
set directory=.,$TEMP
inoremap <C-d> <Del>
syntax on
set background=dark
colorscheme desert
