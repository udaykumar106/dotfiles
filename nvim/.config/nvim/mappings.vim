let mapleader="\<space>"

set nu rnu
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

map <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>i
set rtp+=/usr/local/opt/fzf

nnoremap <S-down> :m .+1<CR>==
nnoremap <S-up> :m .-2<CR>==
vnoremap <S-down> :m '>+1<CR>gv=gv
vnoremap <S-up> :m '<-2<CR>gv=gv

map =j :%!jq .<CR>
map =J :%!jq -S .<CR>
map =y :%!yq eval 'sortKeys(..)' %<CR>
map <leader>o :SymbolsOutline<CR>

":lua vim.o.completeopt = 'menu,noselect,preview'
:lua vim.o.completeopt = "menuone,noselect,preview"


" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>


"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()
"

au BufWinEnter *.go bufdo :e
