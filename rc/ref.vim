"--------------------------------------------------------
" 辞書引き
"--------------------------------------------------------
autocmd FileType ref-* nnoremap <buffer> <silent> q :<C-u>close<CR>  "拡張子別にマニュアルを引く
let g:ref_source_webdict_sites = {
    \ 'je': {
    \   'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',
    \ },
    \ 'ej': {
    \   'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',
    \ },
    \}
let g:ref_source_webdict_sites.default = 'ej'

function! g:ref_source_webdict_sites.je.filter(output)
    return join(split(a:output, "\n")[15 :], "\n")
endfunction

function! g:ref_source_webdict_sites.ej.filter(output)
    return join(split(a:output, "\n")[15 :], "\n")
endfunction

call altercmd#load()
CAlterCommand ej Ref webdict ej
CAlterCommand je Ref webdict je
autocmd BufEnter ==Translate==\ Excite nnoremap <buffer> <silent> q :<C-u>close<CR>

