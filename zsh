export PATH="/usr/local/bin:/usr/bin:$PATH"
export EDITOR='vim'
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
. /usr/local/opt/asdf/libexec/asdf.sh

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

# # GO envs
# export GOPATH=$HOME/dev/go # don't forget to change your path correctly!
# export GOROOT="$(brew --prefix golang)/libexec"
# export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:$GOROOT/bin

# export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"

# # place this after nvm initialization!
# autoload -U add-zsh-hook
# load-nvmrc() {
#   if command -v nvm >/dev/null 2>&1; then
#     if [[ -f .nvmrc && -r .nvmrc ]]; then
#       nvm use
#     elif [[ $(nvm version) != $(nvm version default)  ]]; then
#       echo "Reverting to nvm default version"
#       nvm use default
#     fi
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc

# setopt prompt_subst
# autoload -Uz vcs_info
# zstyle ':vcs_info:*' stagedstr 'M'
# zstyle ':vcs_info:*' unstagedstr '...'
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
# zstyle ':vcs_info:*' formats \
#     '%F{5}%F{2}%b%F{5} %F{2}%c%F{3}%u%f'
# zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
# zstyle ':vcs_info:*' enable git
# +vi-git-untracked() {
#   if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
#       [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
#     hook_com[unstaged]+='%F{1}??%f'
#   fi
# }
#
# precmd () { vcs_info }
# PROMPT='%F{5}%F{6}%n%F{5} %F{3}%c ${vcs_info_msg_0_} %f%# '
#
# strlen () {
#   FOO=$1
#   local zero='%([BSUbfksu]|([FB]|){*})'
#   LEN=${#${(S%%)FOO//$~zero/}}
#   echo $LEN
# }
#
# title () {
#   TITLE=$*
#   echo -ne "\033]0;$TITLE\007"
# }
#
# # show right prompt with date ONLY when command is executed
# preexec () {
#   DATE=$( date +"[%H:%M:%S]" )
#   local len_right=$( strlen "$DATE" )
#   len_right=$(( $len_right+1 ))
#   local right_start=$(($COLUMNS - $len_right))
#
#   local len_cmd=$( strlen "$@" )
#   local len_prompt=$(strlen "$PROMPT" )
#   local len_left=$(($len_cmd+$len_prompt))
#
#   RDATE="\033[${right_start}C ${DATE}"
#
#   if [ $len_left -lt $right_start ]; then
#     # command does not overwrite right prompt
#     # ok to move up one line
#     echo -e "\033[1A${RDATE}"
#   else
#     echo -e "${RDATE}"
#   fi
# }

for f in ~/.dotfiles/aliases_files/*; do source $f; done
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.dotfiles/p10k.zsh ]] || source ~/.dotfiles/p10k.zsh

if [ -x "$(command -v figlet)" ]; then
  figlet -f starwars 'Welcome Yaser'
fi
