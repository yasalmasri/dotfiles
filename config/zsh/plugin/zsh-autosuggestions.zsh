if command -v brew >/dev/null 2>&1; then
  zsh_autosuggestions_path="$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

  if [[ -r "$zsh_autosuggestions_path" ]]; then
    source "$zsh_autosuggestions_path"
  fi

  unset zsh_autosuggestions_path
fi
