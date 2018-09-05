"--------------------------------------------------------
" vim-easymotion
"--------------------------------------------------------
"
" vim の移動を簡易にします
" イメージ的には vimperter の find みたいな感じ
" 現状では <space><space> key で起動します
"
" USEAGE:
"     <Space><Space>j : 行を下に移動
"     <Space><Space>k : 行を上に移動
"     <Space><Space>w : word-object 単位で移動

" 基本キーバインドの設定
let g:EasyMotion_keys = 'hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" ストローク選択を優先
let g:EasyMotion_grouping=1
let g:EasyMotion_smartcase = 1
" let g:EasyMotion_do_mapping = 0
" let g:EasyMotion_startofline = 0
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue
