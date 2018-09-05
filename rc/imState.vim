"--------------------------------------------------------
" IMState: 日本語固有モード
"--------------------------------------------------------
set statusline+=%{IMStatus('[日本語固定]')}
"let IM_CtrlMode = 1
let IM_CtrlMode = 6
inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
set timeout timeoutlen=3000 ttimeoutlen=100
let IMState = 0  " デフォルトでは英語を使用
function! IMCtrl(cmd)
    let cmd = a:cmd
    if cmd == 'On'
        let res = system('ibus engine "kkc"')
    elseif cmd == 'Off'
        let res = system('ibus engine "xkb:jp::jpn"')
    endif
    return ''
endfunction
