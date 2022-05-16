" ~/.vim/ftplugin/python.vim

if has ('nvim')
else
	source ~/dotfiles/vimonly.vim
endif

filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/nvim-treesitter'

" Plug 'AndrewRadev/switch.vim' " could be cool, dunno what it does
" Plug 'Shougo/deoplete.nvim'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'Valloric/YouCompleteMe'
" Plug 'alfredodeza/pytest.vim' " alt to vim-test?
" Plug 'ambv/black'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'ctrlpvim/ctrlp.vim' " fzf is better
" Plug 'janko-m/vim-test'
" Plug 'klen/python-mode'
" Plug 'mgedmin/coverage-highlight.vim'
" Plug 'nvie/vim-flake8'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'rstacruz/sparkup'
" Plug 'scrooloose/syntastic' " was used
" Plug 'sheerun/vim-polyglot'
" Plug 'shougo/neocomplete.vim'
" Plug 'shougo/neosnippet.vim'
" Plug 'tmhedberg/SimpylFold'
" Plug 'tmhedberg/matchit'
" Plug 'tmhedberg/simpylfold' " too slow!
" Plug 'tpope/vim-sleuth' " Not worth overcomplicating things
" Plug 'vim-airline/vim-airline'
" Plug 'vim-scripts/DeleteTrailingWhitespace'
" Plug 'vim-scripts/indentpython.vim'
" Plug 'vim-scripts/repeatable-motions.vim'
" Plug 'vim-scripts/vim-json-bundle'
" Plug 'zchee/deoplete-jedi'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'ap/vim-buftabline'
Plug 'bkad/CamelCaseMotion'
Plug 'bps/vim-textobj-python'
Plug 'davidhalter/jedi-vim' " completions
Plug 'dense-analysis/ale'
Plug 'google/vim-coverage'
Plug 'google/vim-maktaba'
Plug 'jessekelighine/vindent.vim'
Plug 'jnurmine/Zenburn'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'kana/vim-textobj-user'
Plug 'kien/rainbow_parentheses.vim'
Plug 'nelstrom/vim-visual-star-search'
Plug 'python-rope/ropevim'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch' " Vim sugar for UNIX shell commands
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'tpope/vim-repeat' " Allows supported plugin commands to be repeated
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired' " Various keybindings
Plug 'tpope/vim-vinegar' " netre enhancements
Plug 'vim-scripts/python_match.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'wellle/targets.vim'

call plug#end()

let g:ale_enabled=0

let mapleader=" "

" set clipboard+=unnamedplus " doesn't work

" set statusline+=%{syntasticstatuslineflag()}

set clipboard=unnamed " set clipboard to unnamed to access the system clipboard under windows
set completeopt=longest,menuone,preview
set cursorline
set lazyredraw
set nofoldenable
set nostartofline
set number
set omnifunc=syntaxcomplete#complete
set shell=bash
set shortmess+=Ii
set showmatch " automatically show matching brackets. works like it does in bbedit.
set showmode " show the current mode
set statusline+=%#warningmsg#
set statusline+=%*
set tags=./tags,tags;$home
" set undofile " need this? " broken
set wildmode=longest,list
setlocal foldmethod=indent

set autoindent noexpandtab tabstop=4 shiftwidth=4 fileformat=unix

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:jedi#rename_command = "" " Need this to allow ropevim to work
let g:netrw_fastbrowse=0
let g:ropevim_autoimport_modules = ["os", "os.*", "dataclasses.*", "typing.*", "contextlib.*"]
let g:ropevim_guess_project = 1

if has("autocmd")
	"set utf-8 as the default encoding for commit messages
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

nnoremap gk :tjump<CR>
nnoremap gj <C-t>
map <C-PageUp> :bp<cr>
map <C-PageDown> :bn<cr>

imap jk <Esc>
nnoremap <Leader>aI :RopeGenerateAutoimportCache<CR>
nnoremap <Leader>ac :CoverageToggle!<CR>
nnoremap <Leader>af :ALEFix<CR>
nnoremap <Leader>ai :RopeAutoImport<CR>
nnoremap <Leader>al :ALEToggle<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>h :noh<CR>
nnoremap <Leader>k :YcmCompleter GoToReferences<CR>
nnoremap <Leader>nn :set nonumber<CR>
nnoremap <Leader>t :! nosetests<CR>
nnoremap <Leader>ve :e ~/.vimrc<CR>
nnoremap <Leader>vp :e ~/.profile<CR>
nnoremap <Leader>vs :source ~/.vimrc<CR>
map <Leader>r <C-c>r
map <Leader>j `


com! XMLLint :%!xmllint --format --recover - 2>/dev/null
com! XMLSort :%!python ~/dotfiles/python/sort_time.py

com! ReorderJSON :%!python -m json.tool
com! FormatJSON :%!python -c "import json, sys, collections; print json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), indent=4)"

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

autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' |  clip.exe')

" jedi:
" c space
" leader d
" leader n
" leader g
