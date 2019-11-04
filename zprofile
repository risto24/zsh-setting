# welcome message
figlet -f standard Hello Geeks

export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/Users/nishimurarisuto/.composer/vendor/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources:$PATH
export FZF_DEFAULT_OPTS='--height 50% --reverse --border'

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

source ~/.zshrc

