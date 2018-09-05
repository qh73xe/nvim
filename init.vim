" =======================================================
" .config/nvim/init.vim
" =======================================================
"
" VIM (nvim) の基本設定及び, プラグイン管理設定について
" 記述する

" -------------------------------------------------------
" パス管理
" -------------------------------------------------------
let g:python3_host_prog = expand($PYENV_ROOT . '/shims/python3')
let g:ECT_DIR = '$HOME/.config/nvim'      " Nvim 設定管理ディレクトリ
let g:DEIN_DIR = '$HOME/.cache/dein'      " DEIN ディレクトリ
let s:rc_dir = g:ECT_DIR . 'rc/'          " 各プラグインに対する個別設定


" 設定ファイル読み込み関数の定義
" -------------------------------------------------------
function! Loadrc(filename)
    let l:rc = a:filename . '.vim'
    if filereadable(expand(a:filename))
      if s:debackmode == 1
        echo a:filename
        TimerStart
      endif
      execute 'source' a:filename
      if s:debackmode == 1
        TimerEnd
      endif
    else
      echo l:rc . ' is not exist'
    endif
endfunction


" 個別設定ファイル読み込み関数
" -------------------------------------------------------
function! LoadRC(filename)
    let l:rc = s:rc_dir . a:filename . '.vim'
    call Loadrc(l:rc)
endfunction


let mapleader = "\<Space>"           " リーダーボタンを Space key に変更
" -------------------------------------------------------
" Dein の設定
" -------------------------------------------------------
"
" 以下にプラグイン管理プラグイン DEIN に関する設定を記述する
syntax off
if &compatible
  set nocompatible
endif
augroup MyAutoCmd
  autocmd!
augroup END

let s:dein_dir = expand(g:DEIN_DIR)
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let s:toml = '~/.config/nvim/dein.toml'
  let s:lazy_toml = '~/.config/nvim/dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
    call dein#install()
endif

" -------------------------------------------------------
" デフォルト設定
" -------------------------------------------------------
"

" error log

" 以下にその他基本設定に関する記述を行う
setlocal textwidth=80                                " 折り返し幅を80文字にする
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab   " インデントはスペース２つ
set ignorecase smartcase wrapscan incsearch hlsearch " 検索の設定
set wrap                                             " window サイズによって表示行を変える
set formatoptions+=mM                                " 日本語の行の連結時には空白を入力しない。
set display+=lastline                                " 画面最後の行をできる限り表示する。
set bs=start,indent                                  " インサートモードで backspace を使用可能にする
set backspace=indent,eol,start                       " backspace で何でも消せるようにする
set spelllang=en,cjk                                 " スペルチェック時に日本語を除外
set foldmethod=indent                                " フォールディング設定
" set ambiwidth=double                               " 曖昧な文字幅は 2 バイト文字
set list listchars=tab:»-,trail:-,eol:↩,extends:»,precedes:«,nbsp:%  " 不可視文字の可視化

" クリップボートとヤンクを共有
if has('clipboard')
  set clipboard=unnamedplus
endif

" 256 色を使う
if has("termguicolors")
 set termguicolors
endif

" colorscheme
" -------------------------------------------------------

syntax enable
if has("termguicolors")
  colorscheme tender
else
  colorscheme desert
endif
set number                            " 行数を表示
set cursorline showmatch matchtime=3  " 現在行, 対応する括弧などをハイライト, 括弧ハイライト表示は3秒


" -------------------------------------------------------
" Key mapping
" -------------------------------------------------------
map <Leader>i gg=<S-g><C-o><C-o>zz

" * で下の単語を検索
vmap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

"<Space><Space>
nmap <Leader><Leader> 0v$h
nmap <Leader><Leader>w bvwh
nmap <Leader><Leader>0 bvwh~

" インサートモード時
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-l> <Right>

" window 操作
nnoremap <Leader><C-h> <C-w>h
nnoremap <Leader><C-j> <C-w>j
nnoremap <Leader><C-k> <C-w>k
nnoremap <Leader><C-l> <C-w>l

" ジャンプ時にはその単語を中心にする
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" コマンドモード時でも Enter で空白行を挿入
nmap <CR> o<ESC>

" ターミナルモード設定
if has('nvim')
  " ターミナル起動
  nnoremap <Leader>@ :tabe<CR>:terminal<CR>
  " ターミナルモードの終了は通常の Vim 終了を同様に設定
  tnoremap <C-q> <C-\><C-n>:q<CR>
  tnoremap <ESC> <C-\><C-n>:q<CR>
endif
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
