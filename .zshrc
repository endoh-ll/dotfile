# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/bin/vim:$PATH
export PATH=/usr/local/Cellar/mysql/5.7.18/bin:$PATH

# rubyのバージョン管理ツールの設定
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# pythonのバージョン管理ツールの設定
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Path to your oh-my-zsh installation.
export ZSH=/Users/shogo/.oh-my-zsh

# ctagsへのpathを置き換える
alias ctags='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

# Path to Go root
# export GOROOT=/usr/local/Cellar/go/1.7.3/bin/
# Path to Go get
export GOPATH=$HOME/.go

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bureau"
# ZSH_THEME="gnzh"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#

# 補完
autoload -U compinit
compinit -u

# 文字コードの指定
export LANG=ja_JP.UTF-8

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# cdなしでディレクトリ移動
setopt auto_cd

# 移動したディレクトリを一覧表示
setopt auto_pushd


# ビープ音の停止
setopt no_beep

# ビープ音の停止(補完時)
setopt nolistbeep

# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd

# ヒストリ(履歴)を保存、数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# コマンド入力ミスの補完
setopt correct

# zsh-completionsの設定
fpath=(/path/to/homebrew/share/zsh-completions $fpath)

# vim風
bindkey -v

# bundleのeditorを設定
# bundle open [gem name]でinstallしたgemのインストールディレクトリを開けるようになる
# bundle show [gem name]では絶対pathが見える
export EDITOR=/usr/local/bin/vim


# gmailのpasswd
source ~/.passwd.sh

####################################
#### alias start  ##################
####################################
alias sudo='sudo '
alias hist=history
alias v=vim
alias df="df -h"

# bundle checkでinstallの必要があった場合のみbundle installするように修正
alias beck="bundle check > /dev/null || bundle install --path=vendor/bundle --jobs=4 > /dev/null"
alias berc="beck; bundle exec rails console"
alias berr="beck; bundle exec rake routes"
alias bers="beck; bundle exec rails server"

# console上からexcelを開く
alias excel="open -a Microsoft\ Excel"

# soncole上からsublime textを開く
alias sublime="open -a Sublime\ Text"

alias chrome="open -a Google\ Chrome"

# 暗号生成コマンド
alias encrypt-pw="~/bin/encrypt-pw/encrypt-pw_darwin_386"

# go
alias 5="go"

# git rebaseする際にmasterを最新版にしてからrebaseする
alias grbmp="gcm; ggpull; gco -; grbm;"

# 直近の移動したbranchを表示する
alias gcolog="git --no-pager reflog | awk '\$3 == \"checkout:\" && /moving from/ {print \$8}' | grep -v master | uniq | head"

# tcalコマンドで今日の日付をハイライトしたカレンダーを表示
alias cal="cal | grep -C6 --color '`date +'%-d'`' "

# git grep の結果に行番号を付与
alias gggrep="git grep --heading --break"

# zshの設定のon/offを一覧表示
alias showoptions="set -o | sed -e 's/^no\(.*\)on$/\1  off/' -e 's/^no\(.*\)off$/\1  on/'"

alias gl='git log'

# ファイルのコピーとコピーからの復帰を1つのコマンドで行なう
alias cpbk='(){cp $1 $1.cp}'
alias cprc='(){\cp -f $1.cp $1}' # recovery略

alias elasticsearch22='/Users/shogo/elasticsearch-2.2.2/bin/elasticsearch'

alias docker='/Applications/Docker.app/Contents/MacOS/Docker'
####################################
#### alias end #####################
####################################


# 履歴の検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# 行の先頭に移動
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

#C-Uで行頭まで削除
bindkey "^U" backward-kill-line

# C-ESC-u or C-ESC-rでコマンド入力をしながらundo/redo
bindkey "^[u" undo
bindkey "^[r" redo

####################################
#### plugin start ##################
####################################

# zplugの設定
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# 'git open'でリポジトリのページを開く
# https://github.com/paulirish/git-open
zplug "paulirish/git-open", as:command

# 'git recent'で過去に切り替えたブランチの一覧を開く
# https://github.com/paulirish/git-recent
zplug "paulirish/git-recent", as:command

# check コマンドで未インストール項目があるかどうか verbose にチェックし
# false のとき（つまり未インストール項目がある）y/N プロンプトで
# インストールする
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# プラグインを読み込み、コマンドにパスを通す
zplug load --verbose



####################################
#### plugin end ####################
####################################



####################################
#### function start ################
####################################

# タブの色を変更
#関数定義(引数3つ) r,g,bの順
tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}

tab-reset() {
    echo -ne "\033]6;1;bg;*;default\a"
}


####################################
#### function end ################
####################################


# zshのvim入力での現在のモードを表示
# autoload -Uz colors; colors
# autoload -Uz add-zsh-hook
# autoload -Uz terminfo
#
# terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]
# left_down_prompt_preexec() {
#     print -rn -- $terminfo[el]
# }
# add-zsh-hook preexec left_down_prompt_preexec
#
# function zle-keymap-select zle-line-init zle-line-finish
# {
#     case $KEYMAP in
#         main|viins)
#             PROMPT_2="$fg[cyan]-- INSERT --$reset_color"
#             ;;
#         vicmd)
#             PROMPT_2="$fg[white]-- NORMAL --$reset_color"
#             ;;
#         vivis|vivli)
#             PROMPT_2="$fg[yellow]-- VISUAL --$reset_color"
#             ;;
#     esac
#
#     PROMPT="%{$terminfo_down_sc$PROMPT_2$terminfo[rc]%}[%(?.%{${fg[green]}%}.%{${fg[red]}%})%n%{${reset_color}%}]%# "
#     zle reset-prompt
# }
#
# zle -N zle-line-init
# zle -N zle-line-finish
# zle -N zle-keymap-select
# zle -N edit-command-line
#
