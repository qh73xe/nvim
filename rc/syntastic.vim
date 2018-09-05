" ================================================
" Syntastic
" ================================================
"
" 各種言語の Syntastic Checker
" 基本的には, 各種シンタックスチェッカーを導入しておけばよい
"
" この環境では以下のシンタックスチェッカーを導入する必要がある.
"
"     shell: ShellCheck
"         dnf install ShellCheck
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes': ['sh', 'python', 'haskell', 'c', 'javascript', 'json']
    \}

let g:syntastic_python_checkers = ['flake8', 'pylint']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_sh_checkers = ['shellcheck']
