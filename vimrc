set nocompatible              " be iMproved, required

filetype plugin indent on 
syntax on
"syntax enable

call plug#begin('~/.vim/plugged')
" Plug 'Shougo/deoplete.nvim'
" Plug 'Valloric/YouCompleteMe'
" Plug 'dsawardekar/wordpress.vim'
" Plug 'klen/python-mode'
" Plug 'nvie/vim-flake8'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'shougo/neocomplete.vim'
" Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neosnippet-snippets'
Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
Plug 'jnurmine/Zenburn'
Plug 'justinmk/vim-sneak'
Plug 'nelstrom/vim-visual-star-search'
Plug 'rstacruz/sparkup'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'shougo/neosnippet.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-scripts/vim-json-bundle'
call plug#end()



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

" " Show EOL type and last modified timestamp, right after the filename
" set statusline=%<%F%h%m%r\ [%{&ff}]\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})%=%l,%c%V\ %P
" set statusline+=%#warningmsg#
" " set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_save = 0

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

" Python
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
highlight BadWhitespace ctermbg=red guibg=darkred
let python_highlight_all=1
syntax on

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

" if has('gui_running')
" 	set background=dark
" 	colorscheme solarized
" else
" 	colors zenburn
" endif

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

nnoremap <Leader>l :SyntasticCheck<CR>
nnoremap <Leader>L :SyntasticReset<CR>
nnoremap <Leader>t :! nosetests<CR>



au BufNewFile,BufRead *.py
			\ set softtabstop=0 |
			\ set tabstop=4 |
			\ set noexpandtab |
			\ set copyindent |
			\ set preserveindent |
			\ set shiftwidth=4 |
			\ set textwidth=79 |
			\ set autoindent |
			\ set fileformat=unix

au BufNewFile,BufRead *.json
			\ set softtabstop=0 |
			\ set tabstop=4 |
			\ set noexpandtab |
			\ set copyindent |
			\ set preserveindent |
			\ set shiftwidth=4 |
			\ set textwidth=79 |
			\ set autoindent |
			\ set fileformat=unix


com! XMLLint :%!xmllint --format --recover - 2>/dev/null
com! XMLSort :%!python ~/dotfiles/python/sort_time.py

com! ReorderJSON :%!python -m json.tool
com! FormatJSON :%!python -c "import json, sys, collections; print json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), indent=4)"

