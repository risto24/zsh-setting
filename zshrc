[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
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

# Ctrl+sのロック, Ctrl+qのロック解除を無効にする
setopt no_flow_control

# 補完有効化
autoload -U compinit; compinit -C

# 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 色用設定
autoload -Uz colors
colors


# ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status

  if [ ! -e  ".git" ]; then
    # gitで管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全てcommitされてクリーンな状態
    branch_status="%F{208}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # gitに管理されていないファイルがある状態
    branch_status="%F{196}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git addされていないファイルがある状態
    branch_status="%F{196}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commitされていないファイルがある状態
    branch_status="%F{226}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "%F{196}!(no branch)"
    return
  else
    # 上記以外の状態の場合は青色で表示させる
    branch_status="%F{087}"
  fi
  # ブランチ名を色付きで表示する
  echo "%F{076}(%f${branch_status}$branch_name%f%F{076})%f"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの左側表示
PROMPT='%B%F{076}[%f%F{087}%*%f%F{184}%l%f%F{076}%~%f`rprompt-git-current-branch`%F{076}]%f%b %# '



# fzf用設定
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

