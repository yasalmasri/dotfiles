set match-hidden-files off
set page-completions off
set completion-query-items 350

# create big history file
export HISTSIZE=20000
export HISTFILESIZE=20000

# Now bash writes and re-reads the history file every time it prints a new prompt for you.
export PROMPT_COMMAND="history -a ; history -n;  ${PROMPT_COMMAND}"

shopt -s histappend
# don't put duplicate lines in the history and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

bind -x '"\C-xt":printf "%${COLUMNS}s\r" $(date +%T)'
bind '"\C-m":"\C-xt\C-j"'

# GIT ------------------------------------
# show current branch on shell
source ~/.dotfiles/bash_git

DIRECTORY_COLOR="\[\033[1;33m\]"
USER_COLOR="\[\033[1;36m\]"
BRANCH_COLOR="\[\033[1;31m\]"
BLACK="\[\033[0;1m\]"

export PS1="$USER_COLOR\u :: $DIRECTORY_COLOR\W$BRANCH_COLOR\$(parse_git_branch) $DIRECTORY_COLOR$ $BLACK"

export PATH=$PATH:~/.dotfiles/bin

# set editor for gem open
export EDITOR=vim

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

alias fol='nautilus .'
alias op='open .'

# Ruby aliases
alias b="bundle exec"
alias bun='bundle'
alias rn='rails new -T -d postgresql'
alias rs='rails s'
alias rsp='rails s -p'
alias rc='rails c'
alias rg='rails g'
alias rd='rails d'
alias rgm='rails g model'
alias rdm='rails d model'
alias rgc='rails g controller'
alias rdc='rails d controller'
alias rdbc='rake db:create'
alias rdbm='rake db:migrate'
alias rdbd='rake db:drop'
alias rdbs='rake db:seed'
alias rb='rubocop'
alias sp='rspec'

# Heroku aliases
alias gph='git push heroku master'
alias hr='heroku run'
alias hl='heroku logs --tail'
alias ho='heroku open'

#Ember aliases
alias es='ember s'
alias eg='ember g'
alias ed='ember d'
alias egt='ember g template'
alias egc='ember g controller'
alias egm='ember g model'

# bind -f ~/.dotfiles/history_search

export TERM=xterm-256color
