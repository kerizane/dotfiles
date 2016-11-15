set nocompatible              " be iMproved, required

if isdirectory(glob("~/.vim/bundle/"))
	let path=glob("~/.vim/bundle/")
	" set rtp+=~/.vim/bundle/dein.vim
	set runtimepath+=/home/keri/dotfiles/vim/bundle//repos/github.com/Shougo/dein.vim
	call dein#begin(path)
else
	set rtp+=~/vimfiles/bundle/Vundle.vim/
	let path='~/vimfiles/bundle'
	" call vundle#begin(path)
	call vundle#begin(path)
endif

" call dein#add('klen/python-mode')
" call dein#add('sheerun/vim-polyglot')
" call dein#add('shougo/neosnippet.vim')
" call dein#add('Valloric/YouCompleteMe')
" call dein#add('christoomey/vim-tmux-navigator')
call dein#add('altercation/vim-colors-solarized')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('dsawardekar/wordpress.vim', { 'on_ft': ['php'] })
call dein#add('jnurmine/Zenburn')
call dein#add('justinmk/vim-sneak')
call dein#add('nelstrom/vim-visual-star-search')
call dein#add('nvie/vim-flake8', { 'on_ft': ['py'] })
call dein#add('rstacruz/sparkup')
call dein#add('scrooloose/syntastic')
call dein#add('shougo/dein.vim')
" call dein#add('shougo/neocomplete.vim')
" call dein#add('Shougo/neosnippet-snippets')
call dein#add('tmhedberg/matchit')
call dein#add('tmhedberg/SimpylFold')
call dein#add('tpope/vim-abolish', { 'lazy': 1 })
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-eunuch')
call dein#add('tpope/vim-ragtag')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-sensible', { 'lazy': 1 })
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-unimpaired', { 'lazy': 1 })
call dein#add('tpope/vim-vinegar')
call dein#add('vim-scripts/indentpython.vim', { 'on_ft': ['py'] })
call dein#end()

filetype plugin indent on 
syntax on

set autoindent                          " set auto-indenting on for programming
set autoread
set background=dark             " Use colours that work well on a dark background (Console is usually black)
set backspace=indent,eol,start  " make that backspace key work the way it should
set clipboard=unnamed           " set clipboard to unnamed to access the system clipboard under windows
set completeopt=longest
set cursorline
set hidden
set hlsearch
set incsearch
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
set lazyredraw
set number
set omnifunc=syntaxcomplete#Complete
set ruler                       " show the cursor position all the time
set shell=zsh
set shortmess+=I
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set showmode                    " show the current mode
set tags=./tags,tags;$HOME
set ttyfast
set undodir=~/.vim/_undo/
set undofile
set wildmode=longest,list

" Show EOL type and last modified timestamp, right after the filename
set statusline=%<%F%h%m%r\ [%{&ff}]\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})%=%l,%c%V\ %P
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

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

	au BufNewFile,BufRead *.js,*.html,*.css
				\ set tabstop=2 |
				\ set softtabstop=2 |
				\ set shiftwidth=2 |
				\ set expandtab |
				\ set autoindent |
				\ set fileformat=unix |

	autocmd FileType html, xml setlocal shiftwidth=2 tabstop=2
	autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}
endif

if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif

" vp doesn't replace paste buffer
function! RestoreRegister()
	let @" = s:restore_reg
	return ''
endfunction

function! s:Repl()
	let s:restore_reg = @"
	return "p@=RestoreRegister()\<cr>"
endfunction

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

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:neocomplete#enable_at_startup = 1
