if command -v brew >/dev/null 2>&1; then
  zsh_you_should_use_path="$(brew --prefix)/share/zsh-you-should-use/you-should-use.plugin.zsh"

  if [[ -r "$zsh_you_should_use_path" ]]; then
    source "$zsh_you_should_use_path"
  fi

  unset zsh_you_should_use_path
fi
