set nocompatible
set backspace=indent,eol,start

set relativenumber
set number
syntax on
set autoindent
set nosmartindent
filetype indent on
set noexpandtab
set modeline

" set colorcolumn=81

au BufRead,BufNewFile *.vue set filetype=vue
autocmd Filetype html,vue setlocal syntax=html ts=2 softtabstop=2 shiftwidth=2 expandtab colorcolumn=9999
autocmd Filetype php setlocal ts=4 softtabstop=4 shiftwidth=4 expandtab
autocmd Filetype python setlocal ts=8 softtabstop=0 shiftwidth=8 noexpandtab
autocmd Filetype javascript setlocal ts=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype yaml setlocal ts=2 softtabstop=2 shiftwidth=2 expandtab

set tags+=~/.vim/tags/opengl
set tags+=**

" Open definition of function
map <F5> <C-w><C-]><C-w>T

" Open new file
map <F6> :tabm -1<CR>
map <F7> :tabp<CR>
map <F8> :tabf 
map <F9> :tabn<CR>
map <F10> :tabm +1<CR>

" Goto file in new tab
nnoremap gf <C-W>gf
vnoremap gf <C-W>gf

" Additional symbols
map =e a∈<ESC>
map =/e a∉<ESC>
map =c a⊂<ESC>
map =/c a⊄<ESC>
map =u a∪<ESC>
map =/u a∩<ESC>
map =! a∁<ESC>
map =I a∫<ESC>
map =S a∑<ESC>
map == a≡<ESC>
map =D aΔ<ESC>
map =P aπ<ESC>
map =R aρ<ESC>

" Add closing bracket when opening bracket is typed
" inoremap ( ()<Left>
" inoremap { {}<Left>

set mouse=a

set path=.,**,

command Ctags !ctags -R

execute pathogen#infect()

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
map <PageUp> :labove<CR>
map <PageDown> :lbelow<CR>
