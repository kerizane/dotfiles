let mapleader = "\<Space>"

inoremap jk <Esc>
cnoremap jk <Esc>
vnoremap jk <Esc>
snoremap jk <Esc>

nnoremap Y y$
nnoremap <Return> o<Esc>
nnoremap <S-Return> O<Esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap J mzJ`z

nnoremap Q @q
vnoremap Q :norm @q<cr>

" Command Readline
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap b <S-Left>
cnoremap f <S-Right>

vnoremap . :normal .<CR>
vnoremap A :normal A 
vnoremap I :normal I
vmap <silent> <expr> p <sid>Repl()

nmap gcp yygccp
vmap gcp ygvgc`>p

nnoremap <Leader>s :w<cr>
nnoremap <Leader>ve :vsplit $MYVIMRC<cr>
nnoremap <Leader>vs :source $MYVIMRC<cr>
nnoremap <Leader>f gg=G<C-O><C-O>
nnoremap <Leader>j `
nnoremap <Leader>nh :noh<CR>
nnoremap <Leader>nn :set nonumber!<CR>
nnoremap <Leader>c :

nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

if has("user_commands")
	command! -bang -nargs=? -complete=file E e<bang> <args>
	command! -bang -nargs=? -complete=file W w<bang> <args>
	command! -bang -nargs=? -complete=file Wq wq<bang> <args>
	command! -bang -nargs=? -complete=file WQ wq<bang> <args>
	command! -bang Wa wa<bang>
	command! -bang WA wa<bang>
	command! -bang Q q<bang>
	command! -bang QA qa<bang>
	command! -bang Qa qa<bang>
endif

