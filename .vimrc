call pathogen#infect()

filetype plugin indent on
syntax on
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set number
set nowrap
set guifont=Monico
set hidden
map ,t :w \|!spec %<cr>
map ,<right> :bn<cr>
map ,<left> :bp<cr>
map ,a :Ack
map ,q :bd
colorscheme candy

autocmd FileType ruby compiler ruby
no ,w <C-w><C-w>
map ,s <C-w><C-v><C-w><C-w>
map ,c :w\|:!cucumber features<cr>
map ,n :NERDTree<cr>
imap <Nul> <ESC>
imap jk <ESC>
imap kj <ESC>
imap <C-h> <C-W>
map <C-n> :tabn<cr>
map <C-p> :tabp<cr>
map <C-b> :tabnew<cr>
nmap n nzz
nmap N Nzz
vnoremap ,c :s/^/#<cr>
vnoremap ,u :s/^#//<cr>
no J 8j
no K 8k
"set winwidth=104
"set winheight=5
"set winminheight=5
"set winheight=999
set wildmode=longest,list
set wildmenu
set nu
set viminfo='100,<50,s10,h,:100
set modeline
set ls=2

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
" In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vmap <silent>gg :call VisualSearch('gv')<CR>
vmap <silent>gd :call VisualSearch('gd')<CR>
map cc <C-_><C-_>

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        execute "Ack " . l:pattern
    elseif a:direction == 'gd'
        execute "Ack \"(def|function|class) " . l:pattern . "\""
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

map sr :call FindAndReplaceAll('','')

function! FindAndReplaceAll(from, to)
  echo a:from
  execute "%s/" . a:from . "/" . a:to . "/gc"
endfunction 
