" ~/.vim/ftplugin/python.vim

set nocompatible              " be iMproved, required

filetype plugin indent on
syntax on
"syntax enable

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'janko-m/vim-test'
" " Plug 'alfredodeza/pytest.vim' " alt to vim-test?
" Plug 'tmhedberg/simpylfold' " too slow!
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jessekelighine/vindent.vim'
Plug 'airblade/vim-gitgutter'
Plug 'kien/rainbow_parentheses.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'wellle/targets.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'tommcdo/vim-exchange'
Plug 'vim-scripts/python_match.vim'
Plug 'tpope/vim-rsi'
Plug 'ap/vim-buftabline'

" Plug 'AndrewRadev/switch.vim' " could be cool, dunno what it does
" Plug 'tpope/vim-sleuth' " Not worth overcomplicating things

" Plug 'Shougo/deoplete.nvim'
" Plug 'Valloric/YouCompleteMe'
" Plug 'klen/python-mode'
" Plug 'nvie/vim-flake8'
" Plug 'roxma/nvim-yarp'
Plug 'python-rope/ropevim'
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'shougo/neocomplete.vim'
" Plug 'zchee/deoplete-jedi'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/taglist.vim'
Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'
Plug 'altercation/vim-colors-solarized'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'ctrlpvim/ctrlp.vim' " fzf is better
Plug 'google/vim-maktaba'
Plug 'google/vim-coverage'
" Plug 'mgedmin/coverage-highlight.vim'
Plug 'davidhalter/jedi-vim' " completions
Plug 'dense-analysis/ale'
Plug 'jnurmine/Zenburn'
Plug 'justinmk/vim-sneak'
Plug 'nelstrom/vim-visual-star-search'
" Plug 'rstacruz/sparkup'
" Plug 'scrooloose/syntastic' " was used
" Plug 'sheerun/vim-polyglot'
" Plug 'shougo/neosnippet.vim'
" Plug 'tmhedberg/SimpylFold'
" Plug 'tmhedberg/matchit'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch' " Vim sugar for UNIX shell commands
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'tpope/vim-repeat' " Allows supported plugin commands to be repeated
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired' " Various keybindings
Plug 'tpope/vim-vinegar' " netre enhancements
" Plug 'vim-scripts/repeatable-motions.vim'
" Plug 'vim-scripts/indentpython.vim'
" Plug 'vim-scripts/vim-json-bundle'
" Plug 'vim-scripts/DeleteTrailingWhitespace'
" Plug 'ambv/black'

call plug#end()

let mapleader=" "

let g:pymode_lint = 0

set autoindent " set auto-indenting on for programming
set autoread
set background=dark " Use colours that work well on a dark background (Console is usually black)
set backspace=indent,eol,start " make that backspace key work the way it should
set clipboard=unnamed " set clipboard to unnamed to access the system clipboard under windows
set completeopt=longest
set cursorline
set hidden
set hlsearch
set incsearch
set laststatus=2 " make the last line where the status is two lines deep so you can see status always
set lazyredraw
set number
set omnifunc=syntaxcomplete#Complete
set ruler " show the cursor position all the time
set shell=zsh
set shortmess+=I
set showmatch " automatically show matching brackets. works like it does in bbedit.
set showmode " show the current mode
set tags=./tags,tags;$HOME
set ttyfast
set undodir=~/.vim/_undo/
set undofile
set wildmode=longest,list

"" " Show EOL type and last modified timestamp, right after the filename
"" set statusline=%<%F%h%m%r\ [%{&ff}]\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})%=%l,%c%V\ %P

set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_check_on_save = 0
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

if has("autocmd")
	"Set UTF-8 as the default encoding for commit messages
	autocmd BufReadPre COMMIT_EDITMSG,git-rebase-todo setlocal fileencodings=utf-8

	"Remember the positions in files with some git-specific exceptions"
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$")
				\           && expand("%") !~ "COMMIT_EDITMSG"
				\           && expand("%") !~ "ADD_EDIT.patch"
				\           && expand("%") !~ "ADD_EDIT.patch"
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

	autocmd FileType html, xml setlocal shiftwidth=2 tabstop=2
	autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,} 
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

map <C-PageUp> :bp<cr>
map <C-PageDown> :bn<cr>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>l :SyntasticCheck<CR>
nnoremap <Leader>L :SyntasticReset<CR>
nnoremap <Leader>t :! nosetests<CR>
nnoremap <Leader>h :noh<CR>
nnoremap gk :tjump<CR>
nnoremap gj <C-t>
nnoremap <Leader>k :YcmCompleter GoToReferences<CR>
nnoremap <Leader>vs :source ~/.vimrc<CR>
nnoremap <Leader>ve :e ~/.vimrc<CR>
nnoremap <Leader>nn :set nonumber<CR>

nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>ge :Gedit<CR>
imap jk <Esc>

nnoremap <Leader>ac :CoverageToggle!<CR>
nnoremap <Leader>af :ALEFix<CR>
nnoremap <Leader>al :ALEToggle<CR>

nnoremap <Leader>ai :RopeAutoImport<CR>
nnoremap <Leader>aI :RopeGenerateAutoimportCache<CR>

nnoremap <Leader>f :GFiles<CR>

" vmap gs y'>p:'[,']-1s/$/+/\|'[,']+1j!<CR>'[0"wy$:.s§.*§\=w§<CR>'[yyP:.s/./=/g<CR>_j
"



com! XMLLint :%!xmllint --format --recover - 2>/dev/null
com! XMLSort :%!python ~/dotfiles/python/sort_time.py

com! ReorderJSON :%!python -m json.tool
com! FormatJSON :%!python -c "import json, sys, collections; print json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), indent=4)"

se nostartofline
setlocal foldmethod=indent
set nofoldenable


au BufNewFile,BufRead *.py,*.proto
	\ highlight BadWhitespace ctermbg=red guibg=darkred |
	\ set foldenable |
	\ normal zR

" au BufNewFile,BufRead *.py
" 	\ highlight BadWhitespace ctermbg=red guibg=darkred |
" 	\ let python_highlight_all=1 |
" 	\ set autoindent |
" 	\ set encoding=utf-8 |
" 	\ set fileformat=unix |
" 	\ set foldlevel=99 |
" 	\ set foldmethod=indent |
" 	" \ set noexpandtab |
" 	\ set preserveindent |
" 	\ set textwidth=200 |
" 	\ set tabstop=4 |
" 	\ set shiftwidth=4 |
" 	\ set smarttab |
" 	\ set softtabstop=4

" au BufNewFile,BufRead *.py
" 	\ let python_highlight_all=1 |
" 	\ set tabstop=4 |
" 	\ set softtabstop=4 |
" 	\ set shiftwidth=4 |
" 	\ set textwidth=200 |
" 	\ set fileformat=unix

	
" tabs
set autoindent noexpandtab tabstop=4 shiftwidth=4 fileformat=unix

" let g:jedi#force_py_version = 3.7

" jump to next git conflict market
" map <silent> <F8> /^\(<\{7\}\\|>\{7\}\\|=\{7\}\\|\|\{7\}\)\( \\|$\)<cr>

python3 << EOF
import os
import subprocess

if "VIRTUAL_ENV" in os.environ:
    project_base_dir = os.environ["VIRTUAL_ENV"]
    script = os.path.join(project_base_dir, "bin/activate")
    pipe = subprocess.Popen(". %s; env" % script, stdout=subprocess.PIPE, shell=True)
    output = pipe.communicate()[0].decode('utf8').splitlines()
    env = dict((line.split("=", 1) for line in output))
    os.environ.update(env)
EOF

let g:jedi#rename_command = ""
map <Leader>r <C-c>r
map <Leader>j `

let g:ropevim_autoimport_modules = ["os", "os.*", "dataclasses.*", "typing.*", "contextlib.*"]
let g:ropevim_guess_project = 1

" autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' |  clip.exe')

let g:netrw_fastbrowse=0
