if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"

source ~/.dotfiles/aliases

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr 'M'
zstyle ':vcs_info:*' unstagedstr '...'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats \
    '%F{5}%F{2}%b%F{5} %F{2}%c%F{3}%u%f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' enable git
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
      [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
    hook_com[unstaged]+='%F{1}??%f'
  fi
}

precmd () { vcs_info }
PROMPT='%F{5}%F{6}%n%F{5} %F{3}%c ${vcs_info_msg_0_} %f%# '

strlen () {
  FOO=$1
  local zero='%([BSUbfksu]|([FB]|){*})'
  LEN=${#${(S%%)FOO//$~zero/}}
  echo $LEN
}

title () {
  TITLE=$*
  echo -ne "\033]0;$TITLE\007"
}

# show right prompt with date ONLY when command is executed
preexec () {
  DATE=$( date +"[%H:%M:%S]" )
  local len_right=$( strlen "$DATE" )
  len_right=$(( $len_right+1 ))
  local right_start=$(($COLUMNS - $len_right))

  local len_cmd=$( strlen "$@" )
  local len_prompt=$(strlen "$PROMPT" )
  local len_left=$(($len_cmd+$len_prompt))

  RDATE="\033[${right_start}C ${DATE}"

  if [ $len_left -lt $right_start ]; then
    # command does not overwrite right prompt
    # ok to move up one line
    echo -e "\033[1A${RDATE}"
  else
    echo -e "${RDATE}"
  fi

}
