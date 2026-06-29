#!/usr/bin/env zsh

set -u

# Edit this list to control which tmux sessions are started.
# Format: "session_name:/path/to/project[:startup_command]" or ":/path/to/project[:startup_command]" to use the folder name.
PROJECTS=(
  "dot:$HOME/.dotfiles:nvim"
  ":$HOME/dev/hydra-co:nvim"
  ":$HOME/dev/hydra-co/ship-api:nvim"
  ":$HOME/dev/hydra-co/front:nvim"
  ":$HOME/dev/hydra-co/tower:nvim"
  ":$HOME/dev/hydra-co/arian:nvim"
  ":$HOME/dev/hydra-co/infra:nvim"
  ":$HOME/dev/masys/grocery-list:nvim"
  ":$HOME/dev/masys/pellet:nvim"
  ":$HOME/dev/masys/pango:nvim"
  ":$HOME/dev/masys/npm:nvim"
  ":$HOME/dev/masys/haos:nvim"
  ":$HOME/dev/masys/chrono:nvim"
  ":$HOME/dev/masys/ms_info:nvim"
  ":$HOME/dev/masys/https:nvim"
)

if ! command -v tmux >/dev/null 2>&1; then
  print -u2 "tmux is not installed or is not on PATH."
  exit 1
fi

terminal_width="${COLUMNS:-$(tput cols 2>/dev/null || print 120)}"
terminal_height="${LINES:-$(tput lines 2>/dev/null || print 40)}"

for project in "${PROJECTS[@]}"; do
  if [[ "$project" == *:* ]]; then
    session_name="${project%%:*}"
    project_config="${project#*:}"
  else
    session_name=""
    project_config="$project"
  fi

  if [[ "$project_config" == *:* ]]; then
    project_dir="${project_config%%:*}"
    startup_command="${project_config#*:}"
  else
    project_dir="$project_config"
    startup_command=""
  fi

  if [[ ! -d "$project_dir" ]]; then
    print -u2 "Skipping missing directory: $project_dir"
    continue
  fi

  if [[ -z "$session_name" ]]; then
    session_name="${project_dir:t}"
  fi

  session_name="${session_name//./_}"

  if tmux has-session -t "$session_name" 2>/dev/null; then
    print "Skipping existing session: $session_name"
    continue
  fi

  tmux new-session -d -x "$terminal_width" -y "$terminal_height" -s "$session_name" -c "$project_dir"
  tmux split-window -h -p 50 -t "$session_name:0.0" -c "$project_dir"
  tmux split-window -v -p 50 -t "$session_name:0.1" -c "$project_dir"
  tmux split-window -h -p 50 -t "$session_name:0.2" -c "$project_dir"

  window_width="$(tmux display-message -p -t "$session_name:0" "#{window_width}")"
  window_height="$(tmux display-message -p -t "$session_name:0" "#{window_height}")"
  half_width=$((window_width / 2))
  quarter_width=$((window_width / 4))
  half_height=$((window_height / 2))

  tmux resize-pane -t "$session_name:0.0" -x "$half_width"
  tmux resize-pane -t "$session_name:0.1" -y "$half_height"
  tmux resize-pane -t "$session_name:0.2" -x "$quarter_width"

  tmux select-pane -t "$session_name:0.0"

  if [[ -n "$startup_command" ]]; then
    tmux send-keys -t "$session_name:0.0" "$startup_command" Enter
  fi

  print "Started tmux session: $session_name"
done
