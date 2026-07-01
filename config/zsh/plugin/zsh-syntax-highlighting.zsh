if command -v brew >/dev/null 2>&1; then
  zsh_syntax_highlighting_path="$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

  if [[ -r "$zsh_syntax_highlighting_path" ]]; then
    source "$zsh_syntax_highlighting_path"
  fi

  unset zsh_syntax_highlighting_path
fi
