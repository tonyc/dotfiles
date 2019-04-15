# aliases
alias be="bundle exec"
alias bigclock='while true; do tput clear; date --utc +"$CLOCKFMT UTC" | figlet -W -f smblock; date +"$CLOCKFMT" | figlet -W -f smblock; sleep 1; done'
alias clock='while true; do tput clear; date --utc +"$CLOCKFMT UTC"; date +"$CLOCKFMT"; sleep 1; done'
alias d="docker"
alias dpsql="psql -U postgres -h localhost"
alias flushdns="sudo dscacheutil -flushcache"
alias g="git"
alias grep="grep --color=auto"
alias gpom='git push origin master'
alias httphead="curl -I"
alias iexm="iex -S mix"
alias irchome="mosh home -- tmux at -d"
alias ll='ls -l'
alias ls='ls --color'
alias mh='mosh home -- tmux at -d'
alias mp="mosh 192.168.1.2 -- tmux at -d"
alias r="ranger"
alias screen='screen -U'
alias sdr='screen -dr'
alias ssh='ssh -C'
#alias startpostgres='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/log/pg.log start'
#alias startrabbit='brew services start rabbitmq'
#alias stoppostgres='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/log/pg.log stop'
#alias stoprabbit='brew services stop rabbitmq'
alias v="vagrant"
alias webserver="python -m SimpleHTTPServer"

#stty werase undef
#bind 'C-w:backward-kill-word'

# Environment
export CLOCKFMT="%m/%d/%y %H:%M:%S"
export LSCOLORS="gxfxcxdxbxegedabagacad" 
export LSOPTS="--color"
export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.gem/bin"
export ANSI_NORMAL="\[\e[0;37m\]"
export ANSI_RESET="\[\e[0m\]"
export ANSI_YELLOW="\[\e[1;33m\]"
export ANSI_CYAN="\[\e[0;36m\]"
export ANSI_BLUE="\[\e[0;34m\]"
export ANSI_GREEN="\[\e[0;32m\]"
export ACK_COLOR_MATCH="WHITE ON_BLUE"
export ACK_COLOR_LINENO="WHITE"
export ACK_COLOR_FILENAME="YELLOW"
export PS1="($ANSI_CYAN\u$ANSI_YELLOW@$ANSI_CYAN\h$ANSI_RESET):\w$ANSI_GREEN\$(parse_git_branch)$ANSI_RESET\$ "
export GREP_COLOR="0;32"
export LANG=en_US.UTF-8
export MANPATH=/usr/local/git/man:$MANPATH
export GEM_HOME=$HOME/.gem

export HOMEBREW_NO_ANALYTICS=true

# need this since iterm sets it to something stupid
export COMMAND_MODE=unix2003

# enable command history for erlang/iex
export ERL_AFLAGS="-kernel shell_history enabled"

# Fixes enpass on linux being too large on laptop
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCREEN_SCALE_FACTORS=1

# functions for git
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}


function p () {
  echo "${@}" > ~/.current_project
  cd_current_project
}

function cd_current_project () {
  cd "$HOME/dev/`cat ~/.current_project`"
}

cd_current_project

export PATH=$PATH:$EC2_HOME/bin

export EB_HOME=~/.eb
export PATH=$PATH:$EB_HOME

export _Z_CMD="x"
#. $HOME/bin/z.sh


# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
