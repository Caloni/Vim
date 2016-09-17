"
" Arquivo de Configura��es do Vim
" Autor: Wanderley Caloni <wanderley.caloni@bitforge.com.br>
" Version: 2016-09-17
"

" Tabula��o e indenta��o
set nocompatible "N�o vamos nos limitar ao modo vi
set undolevels=1000 "Limite para o defazer
set autoindent
set smarttab
set ignorecase "Aparentemente precisamos disso antes do smartcase
set smartcase "Se n�o usar caracteres mai�sculos, admite busca sem case
set shiftwidth=4
set shiftround
set tabstop=4
set softtabstop=4
set expandtab
set nrformats=hex

" Permite que o backspace ultrapasse linhas
set backspace=2
set exrc
set cino=t0

set autowriteall "Salva automaticamente ao trocar buffers
set hidden "Esconde o buffer ap�s o swap

if exists('&selection')
  set selection=exclusive
endif

" Search e replace
set incsearch "Busca incremental, como o Ctrl-I do VS
set hlsearch "Por padr�o vamos real�ar as buscas

set autochdir "Muda o diret�rio atual automaticamente ao mudar de arquivo

if has("gui_running") "Estamos no GVim
    set guifont=Consolas:h13 "Define a fonte e o tamanho usados
    set mousehide "Enquanto digitamos, esconde o mouse
    set guioptions-=T "Tira barra de atalhos
    set guioptions-=m "Tira menu de comandos
    set guioptions+=r "Coloca barra vertical
    "set lines=999 columns=999 "Maximiza o tamanho da janela
    au GUIEnter * simalt ~x "Tela cheia (x na vers�o Ingl�s/Portugu�s do Windows, n na ver�o Francesa
else " Esse � o console do Vim
    if exists("+lines")
        set lines=50
    endif
    if exists("+columns")
        set columns=100
    endif
endif

set visualbell "Pisca em vez de emitir beeps
set cmdheight=2 "Linha de comando dupla para caber os erros
au VimEnter * set laststatus=2 "Sempre mostra a linha de status
set ruler "Mostra a r�gua, com coluna, linha e porcentagem
set viminfo='20,\"50 "Vamos usar um viminfo para guardar hist�rico de tudo
set path=. "Define diret�rios onde procurar no comando gf, por exemplo
" Habilita/desabilita word wrap (como o Visual Studio)
map <C-E><C-W> :set wrap! lbr<CR>
set history=100 "Mant�m um hist�rico grande de comandos digitados
set number "Mant�m um contador de linhas � esquerda

" Autocomplete
set wildmenu "Mostra op��es de autocomplete na linha de comando
set tags=./tags,~/vim/tags/temp/tags,~/vim/tags/default/tags
set complete=.,b,t
" set complete=.,b,u,u,t,i vers�o hardcore

" Mapeamentos
"
" Atalhos do teclado
"
" Copiar/Colar/Recortar � moda antiga do buffer do sistema
map <C-Insert> "+y
map <S-Insert> "+p
map <S-Del> "+d

" Facilitar uso dos comandos
map <Space> :
map <C-Space> :!
map <S-Space> "syiw:%s/
vmap <S-Space> "sy:%s/
imap <C-Space> <C-C>

" Pr�ximo buffer/tab (como o Borland Builder)
map <C-tab> :bn<CR>
" Buffer/tab anterior (como o Borland Builder)
map <C-S-tab> :bp<CR>
" Alternar entre dois buffers
map <tab> :b #<CR>
" Alternar entre tabs
map <S-tab> :tabNext<CR>
" Procurando em mais de um arquivo a palavra sob o cursor
map <C-_> "syiw:vimg /\<<C-R>s\>/ 
" Procurando em mais de um arquivo usando a sele��o
vmap <C-_> "sy:vimg /\<<C-R>s\>/ 
" Procurando apenas nesse arquivo usando a palavra sob o cursor
map <C-L> "syiw/
" Procurando apenas nesse arquivo usando a sele��o
vmap <C-L> "sy/
" Procurando apenas nesse arquivo usando a palavra sob o cursor
map <S-L> "syiw?
" Procurando apenas nesse arquivo usando a sele��o
vmap <S-L> "sy?
" Incluindo path de include (arquivo)
imap <C-F> <C-X><C-F>
" Salvar como pessoas normais
map <C-S> :w<CR>


" Aumenta a fonte
nnoremap <C-Up> :silent! let &guifont = substitute(
        \ &guifont,
        \ ':h\zs\d\+',
        \ '\=eval(submatch(0)+1)',
        \ '')<CR>
" Diminui a fonte
nnoremap <C-Down> :silent! let &guifont = substitute(
        \ &guifont,
        \ ':h\zs\d\+',
        \ '\=eval(submatch(0)-1)',
        \ '')<CR>

" Busca defini��o de identificador
map <C-K> <C-]>
" Set tiver mais defini��es, v� pra pr�xima
map <C-J> :tnext<CR>
" Busca defini��o de identificador e exibe no preview
map <C-H> :exe "ptjump " . expand("<cword>")<CR>
" Fecha janela de preview
map <Esc> :pclose<CR>
" Habilita/desabilita word wrap (como o Visual Studio)
map <C-E><C-W> :set wrap! lbr<CR>
" Habilita/desabilita visualizacao de white space (como o Visual Studio)
map <C-R><C-W> :set list!<CR>
" Cria nova tab com buffer atual
map <C-T> :tabedit %<CR>
" Alterna menu, barra de comandos e barra de scroll direita/esquerda
nnoremap <C-PageUp> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
" Alterna menu, barra de comandos e barra de scroll direita/esquerda
nnoremap <C-PageDown> :if &go=~#'b'<Bar>set go-=b<Bar>else<Bar>set go+=b<Bar>endif<CR>
" Caminha para tr�s no hist�rico de undo-redo
nnoremap <C-Left> g-<CR>
" Caminha para frente no hist�rico de undo-redo
nnoremap <C-Right> g+<CR>
" Novo arquivo
map <C-N> :enew<CR>
" Lista buffers
map <C-Z> :buffers<CR>:buffer<Space>

" Incrementando v�rios n�meros de uma vez.
function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>

" Fun��es

" Geral
" Cria novo campo cloze-deletion para o Supermemo/Anki
map <F1> di{{c1::<Esc>pa}}<Esc>F1
" Habilita/desabilita realce de matches da �ltima busca
map <F3> :set hlsearch!<CR>
" Abre a pasta contendo o arquivo atual.
if has("gui_running")
  if has("win32")
    :map <silent> <F4> :if expand("%:p:h") != ""<CR>:!start explorer.exe %:p:h<CR>:endif<CR><CR>
  endif
endif
" Atualiza diret�rio atual para onde est� arquivo atual (�s vezes o Vim falha em atualizar)
map <F5> :cd %:p:h<CR>
" Insere ID �nico por minuto para criar refer�ncia do PKB.
inoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>
cnoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>
" Pr�ximo elemento da busca/lista de erros (como VS6)
map <F8> :cn<CR>
" Alterna menu, barra de comandos e barra de scroll direita/esquerda
map <F12> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

"
" Control
" Apaga buffer (equivalente a fechar a aba, n�o confundir com tabs do vi)
map <C-F4> :bd<CR>
" Insere ID �nico por minuto para criar refer�ncia do PKB.
inoremap <C-F5> <C-R>=strftime("%y%m%d%H%M")<CR>
cnoremap <C-F5> <C-R>=strftime("%y%m%d%H%M")<CR>
" Salva e alterna entre cpp e header (atalho do C++ Builder)
map <C-F6> :w<CR>:A<CR>
map <Leader>a :e ++enc=latin1<CR>
map <Leader>u :e ++enc=utf-8<CR>
map <C-F12> :NextColorScheme<CR>

"
" Shift
" Retira campo cloze-deletion para o Supermemo/Anki (colocar o cursor dentro do verbete).
map <S-F1> T:d2F{f}2x
" Gera tags para arquivo tags auxiliar
map <S-F5> :!ctagsauto %:p:h temp<CR>
" Insere ID �nico por minuto para criar refer�ncia do PKB.
inoremap <S-F5> <C-R>=strftime("%H:%M:%S")<CR>
" Elemento anterior da busca/lista de erros
map <S-F8> :cp<CR>
map <S-F12> :PrevColorScheme<CR>

" Backup dos arquivos
set backup
set backupdir=~\Vim\backup

" Desfazer persistido
set undodir=~\Vim\undo
set undofile
set undolevels=1000
set undoreload=10000

set listchars=eol:�,tab:��,trail:_
set showfulltag
set display+=lastline
set printoptions=syntax:y
set ve=block
set wrap lbr "Com word wrap por padr�o.

" Isso deve sempre atualizar o diretorio atual
autocmd BufEnter * lcd %:p:h

" StatusLine
set statusline=
set statusline +=%n         "n�mero do buffer
set statusline +=\ %F       "full path
set statusline +=%m         "modified flag
set statusline +=\ %=       "Para a direita
set statusline +=\ %l,%c    "Linha e coluna
set statusline +=\ %P       "porcentagem do arquivo

set guitablabel=%t
set guitabtooltip=%F

" Configura��es para ajudar no dia-a-dia
let MRU_Max_Entries = 5000

" Abrevia��es
"ia -- <C-V>151
ia c_ c_str()
ca mru MRU

" Experimentos
nmap j gj
nmap k gk
set directory=.,$TEMP
inoremap <C-d> <Del>

" Cores!
syntax on "Ligando syntax highlighting
set background=dark
colorscheme desert

