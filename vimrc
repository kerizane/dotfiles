set nocompatible              " be iMproved, required
if isdirectory(glob("~/.vim/bundle/Vundle.vim"))
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
else
	set rtp+=~/vimfiles/bundle/Vundle.vim/
	let path='~/vimfiles/bundle'
	call vundle#begin(path)
endif


Plugin 'VundleVim/Vundle.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'Chiel92/vim-autoformat'
Plugin 'jnurmine/Zenburn'
" Plugin 'sheerun/vim-polyglot'
" Plugin 'klen/python-mode'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/syntastic'
Plugin 'shougo/neocomplete.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'dsawardekar/wordpress.vim'
Plugin 'rstacruz/sparkup'
call vundle#end()

filetype plugin indent on 
set omnifunc=syntaxcomplete#Complete
syntax on

set hlsearch
set undofile
set undodir=~/.vim/_undo/
set ai                          " set auto-indenting on for programming
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set incsearch
set autoread
set lazyredraw
set ttyfast
set hidden
set shell=zsh
set ruler                       " show the cursor position all the time
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
set backspace=indent,eol,start  " make that backspace key work the way it should
set background=dark             " Use colours that work well on a dark background (Console is usually black)
set showmode                    " show the current mode
set clipboard=unnamed           " set clipboard to unnamed to access the system clipboard under windows
set cul
set number
set shortmess+=I
set wildmode=longest,list
" hi CursorLine term=none cterm=none ctermbg=3 

" Show EOL type and last modified timestamp, right after the filename
set statusline=%<%F%h%m%r\ [%{&ff}]\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})%=%l,%c%V\ %P

if has("autocmd")
	"Set UTF-8 as the default encoding for commit messages
	autocmd BufReadPre COMMIT_EDITMSG,git-rebase-todo setlocal fileencodings=utf-8

	"Remember the positions in files with some git-specific exceptions"
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$")
				\           && expand("%") !~ "COMMIT_EDITMSG"
				\           && expand("%") !~ "ADD_EDIT.patch"
				\           && expand("%") !~ "addp-hunk-edit.diff"
				\           && expand("%") !~ "git-rebase-todo" |
				\   exe "normal g`\"" |
				\ endif

	autocmd BufNewFile,BufRead *.patch set filetype=diff
	autocmd BufNewFile,BufRead *.diff set filetype=diff

	autocmd Syntax diff
				\ highlight WhiteSpaceEOL ctermbg=red |
				\ match WhiteSpaceEOL /\(^+.*\)\@<=\s\+$/

	autocmd Syntax gitcommit setlocal textwidth=74
endif

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

if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif

" Python
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
highlight BadWhitespace ctermbg=red guibg=darkred
let python_highlight_all=1
syntax on

if has("autocmd")
	au BufNewFile,BufRead *.py
				\ set tabstop=4 |
				\ set softtabstop=4 |
				\ set shiftwidth=4 |
				\ set textwidth=79 |
				\ set expandtab |
				\ set autoindent |
				\ set fileformat=unix

	au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

	au BufNewFile,BufRead *.js,*.html,*.css
				\ set tabstop=2 |
				\ set softtabstop=2 |
				\ set shiftwidth=2 |
				\ set expandtab |
				\ set autoindent |
				\ set fileformat=unix |

	autocmd FileType html setlocal shiftwidth=2 tabstop=2
	autocmd FileType xml setlocal shiftwidth=2 tabstop=2
endif

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



let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
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
vmap <silent> <expr> p <sid>Repl()

nmap gcp yygccp
vmap gcp ygvgc`>p

" Leader mappings
let mapleader = "\<Space>"
nnoremap <Leader>s :w<cr>
nnoremap <Leader>ve :vsplit $MYVIMRC<cr>
nnoremap <Leader>vs :source $MYVIMRC<cr>
nnoremap <Leader>f gg=G<C-O><C-O>
nnoremap <Leader>j `
nnoremap <Leader>nh :noh<CR>
nnoremap <Leader>nn :set nonumber!<CR>


" vp doesn't replace paste buffer
function! RestoreRegister()
	let @" = s:restore_reg
	return ''
endfunction

function! s:Repl()
	let s:restore_reg = @"
	return "p@=RestoreRegister()\<cr>"
endfunction

if has("python")
	pyfile ~/.vim/support_venv.py
endif


function! HighlightRepeats() range
	let lineCounts = {}
	let lineNum = a:firstline
	while lineNum <= a:lastline
		let lineText = getline(lineNum)
		if lineText != ""
			let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
		endif
		let lineNum = lineNum + 1
	endwhile
	exe 'syn clear Repeat'
	for lineText in keys(lineCounts)
		if lineCounts[lineText] >= 2
			exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
		endif
	endfor
endfunction

command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()
hi link Repeat Statement

set tags=./tags


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
