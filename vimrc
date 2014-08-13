set nocompatible
set number
let mapleader = "-"
set noswapfile
inoremap jj <esc>
inoremap JJ <esc>
colorscheme desert
set hlsearch incsearch
set showcmd
set showmatch
set ignorecase
set hidden
set background=light
set background=dark
set shellcmdflag=-c
set mouse=a
set wildignorecase
syntax on
augroup file_typevim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" Statusline settings ----------------------- {{{
set laststatus=2
set statusline=%f "path to file
set statusline+=\ -\ FileType: "descriptor
set statusline+=%y "filetype
set statusline+=%= "other side of status line
set statusline+=/ "seperator 
set statusline+=%L " line count
" }}}
" Breaking bad habits ----------------- {{{
inoremap <esc> <nop>
nnoremap <c-w> <nop>
" }}}
" tabular settings ------------------ {{{
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
" }}}
inoremap <F4> :wa <Enter> :make <Enter>
inoremap <F5> :!./out <Enter>
inoremap <c-u> <esc> viwUi
nnoremap <c-u> viwU<esc>
nnoremap <leader>rr !./out 
nnoremap dn <nop> " cancel delete
nnoremap <leader>we :w \| :e<space>
vnoremap <leader>jj <esc> 
nnoremap <leader>o  :!op %
nnoremap <leader>g :silent execute "grep -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
iabbrev Include include
iabbrev INclude include
" editing and saving MYVIMRC ------------- {{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}
nnoremap ge <C-W>w
" python iabbrevs -------- {{{
augroup python_group
  autocmd!
  autocmd FileType python :iabbrev <buffer> iabbrev iff if:
augroup END
" }}}
" c language iabbrevs ----------- {{{
augroup c_group
  autocmd!
  autocmd FIleType c :iabbrev <buffer> iabbrev iff if ()
augroup END
" }}}
" c++ iabbrevs -------- {{{
augroup cplusplus_group
  autocmd!
  autocmd FIleType cpp :iabbrev <buffer> iff if ()
  autocmd FIleType cpp :iabbrev <buffer> stdv std::vector<
  autocmd FIleType cpp :iabbrev <buffer> stds std::string
  autocmd FIleType cpp :iabbrev <buffer> Include include<left>
  autocmd FIleType cpp :iabbrev <buffer> INclude include<left>
  autocmd Filetype cpp :let c_no_curly_error = 1
  autocmd FileType cpp nnoremap <leader>m :make clean<cr>:make<cr>
augroup END 
" }}}


" tex preferences --------------- {{{
augroup tex files
  autocmd!
  autocmd FileType tex set number!
  autocmd FileType tex set spell spelllang=en_us
  autocmd FileType tex nnoremap j gj
  autocmd FileType tex nnoremap k gk
  autocmd FileType tex nnoremap <leader><Enter> <Enter>i\itbf{
augroup END
" }}}



onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F(vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F{vi{<cr>
