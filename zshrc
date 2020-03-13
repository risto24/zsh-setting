# Chrome起動
alias chrome="open /Applications/Google\ Chrome.app"
# Sfari起動
alias safari="open -a Safari"
# laコマンドを設定
alias la='ls -alh'
# llコマンドを設定
alias ll='ls -lh'
# ディレクトリ配下の.DS_Storeを削除する
alias delds='find . -name ".DS_Store" | xargs rm'
# 起動ポート確認
alias port='sudo lsof -i -P | grep "LISTEN"'
# グローバルIPの確認
alias gip="curl ifconfig.io"
# ローカルIPの確認
alias lip="ifconfig|grep 192.168"
# アノテーションコメント検索
alias todo='git grep -ne " TODO:" -ne " FIXME:" -ne " HACK:"|tr -d " "|grep --color=auto "TODO\|FIXME\|HACK"'
# 削除コマンド確認
alias rm="rm -i"
# docker-composeコマンド
alias dcom="docker-compose"
# コマンド結果コピーコマンド
alias pbcopy="xsel --clipboard --input"
# Ctrl+sのロック, Ctrl+qのロック解除を無効にする
setopt no_flow_control
# lazygit コマンド
alias lg="lazygit"
# エクスプローラーを開く
alias open="xdg-open"
# viをvimにする
alias vi="vim"
# 補完有効化
autoload -U compinit; compinit -C
# 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 色用設定
autoload -Uz colors
colors

# Git表示する
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{184}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{208} %c%u%b%f"
zstyle ':vcs_info:*' actionformats '(%b|%a)'
precmd () { vcs_info }

# プロンプトの左側表示
#PROMPT='%F{208}[%f%F{184}%l%f%F{087} %~%f${vcs_info_msg_0_}%F{208}]%f%# '
PROMPT='%F{208}[%f%F{184}%l%f%F{087} %~%f${vcs_info_msg_0_}%F{208}]%f%# '
# PROMPT='%F{184}%l%f%F{087}%~%f${vcs_info_msg_0_}%# '
#PROMPT='%~ %# '

# fzf用設定

fvim() {
  files=$(git ls-files) &&
  selected_files=$(echo "$files" | fzf -m  --preview 'head -100 {}') &&
  vim $selected_files
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
