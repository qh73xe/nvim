" =================================================
" .config/nvim/init.vim
" =================================================
"
" VIM (nvim) の基本設定及びを記述

" -------------------------------------------------
" OS 判定
" -------------------------------------------------
if (has("win64") || has("win32"))
  let g:OS = "WINDOWS"
else
  let g:OS = substitute(system('uname'), '\n', '', 'g')
  if g:OS == "Linux"
    let s:tmp = substitute(system('uname -r'), '\n', '', 'g')
    if match(s:tmp, "Microsoft") != -1
      let g:OS = "WSL"
    endif
  endif
endif

" -------------------------------------------------
" パス管理
" -------------------------------------------------
if (g:OS == "WINDOWS")
  let g:python3_host_prog = expand('$HOME/scoop/shims/python3')
  let g:ECT_DIR = '$HOME/AppData/Local/nvim' " Nvim 設定管理ディレクトリ
else
  let g:python3_host_prog = expand('/usr/bin/python3')
  let g:ECT_DIR = '$HOME/.config/nvim' " Nvim 設定管理ディレクトリ
endif

if exists('$VIRTUAL_ENV')
  let g:python3_host_prog = expand('$VIRTUAL_ENV/bin/python3')
endif

" 各プラグインに対する個別設定
let s:rc_dir = g:ECT_DIR . 'rc/'

" DEIN ディレクトリ
let g:DEIN_DIR = '$HOME/.cache/dein'


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
  set nocompatible
endif

let s:dein_dir = expand(g:DEIN_DIR)
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#add(g:DEIN_DIR)
  let s:toml = g:ECT_DIR  . '/dein.toml'
  let s:lazy_toml = g:ECT_DIR  . '/dein_lazy.toml'
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
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
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

" 矢印キーでなら行内を動けるように
nmap <Down> gj
nmap <Up>   gk

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

" 入力モードでのカーソル移動
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

" vim grep 時の種々移動
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

" -------------------------------------------
" 全角対応
" -------------------------------------------
set ambw=single
let g:vim_json_syntax_conceal = 0

" -------------------------------------------
" 全角対応
" -------------------------------------------
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
colorscheme desert

" -------------------------------------------
" GUI setting
" -------------------------------------------
set guicursor=
autocmd OptionSet guicursor noautocmd set guicursor=


au BufNewFile,BufRead *.rest setf rst
