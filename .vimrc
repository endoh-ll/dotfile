"==============================================
" native vim config --------------------------
"==============================================
" タブを複数の空白に置き換え
set expandtab
set tabstop=2
set number
" ファイルでの現在の位置を表示
set ruler
" 下から2行目にステータスを常時表示
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}\[%{ALEGetStatusLine()}]\%=%-14.(%l,%c%V%)%P\ \[ENC=%{&fileencoding}]\ 

" 検索結果をハイライト表示
set hlsearch
" 前の行のインデントを継続
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" Vimが挿入するインデントの幅
set shiftwidth=2
" 構文ごとに色をつける
syntax on
highlight LineNr ctermfg=darkyellow
filetype plugin indent on
colorscheme ron

"インクリメンタルサーチを行う
set incsearch

" インサートモードで入力した文字が消せなくなった場合
" http://qiita.com/omega999/items/23aec6a7f6d6735d033f
set backspace=indent,eol,start

" helpを日本語化
set helplang=ja,en

" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を10000件保存する
set history=10000

" goの補完を有効にする
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview


" 入力中のコマンドを表示
set showcmd

" 指定した行前からスクロールを行なう
set scrolloff=5

"ビープ音すべてを無効にする
set visualbell
set t_vb=
"エラーメッセージの表示時にビープを鳴らさない
set noerrorbells

" vim-json用
" カーソル位置のキー名に""を付与しない
" https://github.com/elzr/vim-json
let g:vim_json_syntax_conceal = 0
let g:indentLine_noConcealCursor=""

" bufferでファイルを切り替える際に
" 未保存のファイルでも警告を出さない
set hidden

" スワップファイルを作らない
set noswapfile

" ファイルの末尾に改行コードを追加しない
" set nofixeol

" ファイルセーブ時のみaleでsyntax check
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" 一行が長くなっても最後まで表示する
" http://itchyny.hatenablog.com/entry/2014/12/25/090000
set display=lastline

" 補完メニューの高さを指定
set pumheight=10
" --------------------------------------------
"


"==============================================
" keybind -------------------------------------
"==============================================

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <silent><ESC><ESC> :nohlsearch<CR>

" Leaderを<Space>キーに置き換える
" http://postd.cc/how-to-boost-your-vim-productivity/
let mapleader = "\<Space>"

" <Space>wでファイル保存
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
" <Space>wpでファイル保存後終了
nnoremap <Leader>wq :wq<CR>

" <Space>2回でノーマルモードに戻る
" 空白が2回入れたかったら<Tab>を使ってほしい
" 空白の入力が遅れるのでコメントアウト
" inoremap <Leader><Leader> <ESC>
"
" https://qiita.com/hachi8833/items/7beeee825c11f7437f54#level-5
"
" jjでインサートモードを抜ける
" タイプした後ですぐに上下にカーソル移動できる
inoremap <silent> jj <ESC>

" <Space>pと<Space>yでクリップボードに保存
nmap <Leader>y "+y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" ファイルの先頭と末尾に移動
" うっかり移動してもg'rで戻ってこれる
" 連打されると戻れない
nnoremap <CR><CR> mrG
nnoremap <BS><BS> mrgg
" 基本機能の g; で充分
" nnoremap <CR>r g'r
" nnoremap <BS>r g'r

" 選択範囲をvで単語、段落、行...と拡大できる
" <C-v>で1つ前のレベルに戻せる
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" <C-a>で全範囲選択
nnoremap <C-a> ggvGG$

" <Space-:>でコマンド履歴表示
" <Space-;>で検索履歴表示
nnoremap <Leader>: q:
nnoremap <Leader>; q/

" q:、q/、q? は無効化
nnoremap q: <NOP>
nnoremap q/ <NOP>
nnoremap q? <NOP>

" -でNERDTreeを表示/非表示切り替え
" nnoremap <silent>- :lcd %:h<CR>:NERDTreeToggle<CR>
"
" C-h と C-kでタグジャンプ & 画面分割
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" 検索と同じ要領でhunkを検索できる
" やっぱりshift押しながらは辛いのでmにする
nmap <Leader>n <Plug>GitGutterNextHunk
nmap <Leader>m <Plug>GitGutterPrevHunk

" aleのエラー間を移動する
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Yで行末までのヤンクにする
" http://itchyny.hatenablog.com/entry/2014/12/25/090000
nnoremap Y y$

" タブの移動をカーソル移動に似た形に変更
nnoremap gl gt
nnoremap gh gT
nnoremap 9gt 1gtgT

nmap ; :Buffers
nmap t :Files

"==============================================
" NeoBundle scripts ----------------------------
"==============================================
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/Users/shogo/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/Users/shogo/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'ctrlpvim/ctrlp.vim'

NeoBundle 'terryma/vim-expand-region'

" カラーテーマ追加
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/vim-colors-solarized'

" NERDTreeよりも高速でファイル検索&移動
NeoBundle 'justinmk/vim-dirvish'

NeoBundle 'tpope/vim-rails'

" 非同期syntax check
NeoBundle 'w0rp/ale'

" Rubyのendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

" コメントON/OFFを手軽に実行
" 対象の範囲を選択し、Ctrl+-を2回で実行
" 1行だけなら範囲選択の必要なし
NeoBundle 'tomtom/tcomment_vim'

" 行末の半角スペースを可視化
" :FixWhitespaceで行末の半角スペースを自動削除
NeoBundle 'bronson/vim-trailing-whitespace'

"NERD ディレクトリをツリー表示"
" NeoBundle 'scrooloose/nerdtree'

" ファイルを開いた履歴を管理
" :MRUで一覧表示
" :Mr, :MRでも可
NeoBundle 'yegappan/mru'

" 日本語helpを読み込む
NeoBundle 'vim-jp/vimdoc-ja'

" markdown
NeoBundle 'tpope/vim-markdown'

" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1


" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" vim slim
NeoBundle 'slim-template/vim-slim.git'

" denite.nvim
NeoBundle 'Shougo/denite.nvim'

" vim-json
NeoBundle 'elzr/vim-json'

" vim-go
NeoBundle 'fatih/vim-go'

" coffee-script
NeoBundle 'kchmck/vim-coffee-script'

" vim-gitgutter
NeoBundle 'airblade/vim-gitgutter'

" vim-tags
NeoBundle 'szw/vim-tags'

" vim the silver searcher
" ag.vimは非推奨らしいのでack.vim
" NeoBundle 'rking/ag.vim'
NeoBundle 'mileszs/ack.vim'

" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'

" 対応するdef ~ endに%でジャンプ
NeoBundle 'tmhedberg/matchit'

" vimでfzf検索
NeoBundle 'junegunn/fzf.vim'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"=================================================
"  "End NeoBundle Scripts ------------------------
"=================================================




"=================================================
"  " vim scripts ---------------------------------
"=================================================

"""""""""""""""""""""""""""""
" 全角スペースの表示
" http://inari.hatenablog.com/entry/2014/05/05/231307
"""""""""""""""""""""""""""""
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
   augroup ZenkakuSpace
     autocmd!
       autocmd ColorScheme * call ZenkakuSpace()
       autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '＿')
   augroup END
   call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 最後のカーソルの位置を復元
""""""""""""""""""""""""""""""
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
		\ endif
endif

""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-color
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" denite.vimの設定

let g:python3_host_prog = expand('~/.pyenv/shims/python')
""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
" vim-markdownの設定
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
" vim jq の設定
" http://qiita.com/tekkoc/items/324d736f68b0f27680b8

command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction
"""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
" ack.vimでAgを使う
" https://qiita.com/Biacco/items/b750c073a92a8e9fea7d
let g:ackprg = 'ag --nogroup --nocolor --column'
"""""""""""""""""""""""""""""
