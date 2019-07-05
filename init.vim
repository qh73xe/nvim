" =================================================
" .config/nvim/init.vim
" =================================================
"
" VIM (nvim) の基本設定及びを記述

" -------------------------------------------------
" パス管理
" -------------------------------------------------
let g:ECT_DIR = '$HOME/.config/nvim'      " Nvim 設定管理ディレクトリ
let g:DEIN_DIR = '$HOME/.cache/dein'      " DEIN ディレクトリ
let s:rc_dir = g:ECT_DIR . 'rc/'          " 各プラグインに対する個別設定


" 設定ファイル読み込み関数の定義
" -------------------------------------------------
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
" -------------------------------------------------
function! LoadRC(filename)
  let l:rc = s:rc_dir . a:filename . '.vim'
  call Loadrc(l:rc)
endfunction


" -------------------------------------------------
" Dein の設定
" -------------------------------------------------
"
" 以下にプラグイン管理プラグイン DEIN に関する
" 設定を記述する
syntax off
augroup MyAutoCmd
  autocmd!
augroup END

if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_dir = expand(g:DEIN_DIR)
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#add('~/.cache/dein')
  let s:toml = '~/.config/nvim/dein.toml'
  let s:lazy_toml = '~/.config/nvim/dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
if dein#check_install()
    call dein#install()
endif

" =================================================
" デフォルト設定
" =================================================
" 以下にその他基本設定に関する記述を行う
"
syntax enable
setlocal textwidth=80
set wrap number hls
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set cursorline showmatch matchtime=3
set foldmethod=indent
set list listchars=tab:»-,trail:-,eol:↩,extends:»,precedes:«,nbsp:%
if has('clipboard')
  set clipboard=unnamedplus
endif
set bs=start,indent
set backspace=indent,eol,start
set conceallevel=0
set ambiwidth=single

" -------------------------------------------
" Key mapping
" -------------------------------------------
let mapleader = "\<Space>"
map <Leader>i gg=<S-g><C-o><C-o>zz

" * で下の単語を検索
vmap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

"<Space><Space>
nmap <Leader><Leader> 0v$h
nmap <Leader><Leader>w bvwh
nmap <Leader><Leader>0 bvwh~

" ジャンプ時にはその単語を中心にする

nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" ターミナルモード設定
if has('nvim')
  " ターミナル起動
  nnoremap <Leader>@ :tabe<CR>:terminal<CR>
  " ターミナルモードの終了は通常の Vim 終了を同様に設定
  tnoremap <C-q> <C-\><C-n>:q<CR>
  tnoremap <ESC> <C-\><C-n>:q<CR>
endif

set guicursor=
autocmd OptionSet guicursor noautocmd set guicursor=

set ambw=single
