" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" let b:ale_linters = []
" let b:ale_linters = ['pyflakes']
" let b:ale_linters = ['flake8', 'mypy']
let b:ale_linters = ['mypy']
let g:ale_virtualenv_dir_names = ['.venv']
let g:ale_python_auto_pipenv = 1
let g:ale_python_auto_poetry = 1
let g:ale_python_flake8_auto_pipenv = 1
let g:ale_python_flake8_auto_poetry = 1

let b:ale_fixers = ['black']
" let b:ale_fixers = ['black', 'isort']


" let g:ale_python_flake8_change_directory = 'project~/dotfiles ⑂master* $
'
" let g:ale_python_flake8_executable = 'flake8'
" let g:ale_python_flake8_options = ''
" let g:ale_python_flake8_use_global = 0

let g:ale_python_mypy_auto_pipenv = 1
let g:ale_python_mypy_auto_poetry = 1

" let g:ale_python_mypy_executable = 'mypy'
" let g:ale_python_mypy_ignore_invalid_syntax = 0
" let g:ale_python_mypy_options = ''
" let g:ale_python_mypy_show_notes = 1
" let g:ale_python_mypy_use_global = 0

" let g:ale_python_pyright_config = {}
" let g:ale_python_pyright_executable = 'pyright-langserver'
