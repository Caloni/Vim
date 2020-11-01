map <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
set guifont=Consolas:h13
set mousehide
set guioptions-=T
set guioptions-=m
set guioptions-=r
syntax on
au GUIEnter * simalt ~x
syntax off
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
colorscheme paramount
