" ==============================
" context_filetype.vim
" ==============================
"
" Last Change: 02-Feb-2017.
" コンテキストによる filetype の変更

let g:context_filetype#filetypes = {
  \ 'toml': [
  \   {
  \     'filetype':'vim',
  \     'start': '\v^hook_(add|source|post_source)\s\=\s'."'+$",
  \     'end': "\v^'{3}$"
  \   },
  \ ],
  \ 'html': [
  \   {
  \     'filetype': 'javascript',
  \     'start': '<script>',
  \     'end':   '</script>'
  \   },
  \   {
  \     'filetype': 'css',
  \     'start': '<style type="text/css">',
  \     'end': '</style>'
  \   },
  \ ],
  \ 'htmldjango': [
  \   {
  \     'filetype': 'javascript',
  \     'start': '<script>',
  \     'end':   '</script>'
  \   },
  \   {
  \     'filetype': 'css',
  \     'start': '<style type="text/css">',
  \     'end': '</style>'
  \   },
  \ ],
  \}
let g:context_filetype#search_offset = 100
