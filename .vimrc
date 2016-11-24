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

" 改行時の自動コメントアウトを無効化
set formatoptions-=ro

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

" --------------------------------------------
"


"==============================================
" Keybind -------------------------------------
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
nnoremap <CR><CR> mrG
nnoremap <BS><BS> mrgg
nnoremap <CR>r g'r
nnoremap <BS>r g'r


" 選択範囲をvで単語、段落、行...と拡大できる
" <C-v>で1つ前のレベルに戻せる
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" <C-a>で全範囲選択
nnoremap <C-a> ggvGG$

"==============================================
"NeoBundle Scripts ----------------------------
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

" 静的解析
NeoBundle 'scrooloose/syntastic'

" Rubyのendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

" コメントON/OFFを手軽に実行
" 対象の範囲を選択し、Ctrl+-を2回で実行
" 1行だけなら範囲選択の必要なし
NeoBundle 'tomtom/tcomment_vim'

" 行末の半角スペースを可視化
" :FixWhitespaceで行末の半角スペースを自動削除
NeoBundle 'bronson/vim-trailing-whitespace'

"ディレクトリをツリー表示"
"NeoBundle 'scrooloose/nerdtree'

" ファイルを開いた履歴を管理
" :MRUで一覧表示
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

" vim-go
NeoBundle 'fatih/vim-go'

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
"  " Vim Scripts ---------------------------------
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

" --------------------------------
" rubocop
" --------------------------------
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
"let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby'] }
"let g:syntastic_ruby_checkers = ['rubocop']

""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
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
" vim-fugitiveの設定

set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ \[ENC=%{&fileencoding}]%P
"""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
" vim-markdownの設定
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"""""""""""""""""""""""""""""
