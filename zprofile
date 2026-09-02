export EDITOR="vim"

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/Applications/MakeMKV.app/Contents/MacOS:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY="YES"
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

. "${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.zsh"

# Keep this last so asdf shims remain first.
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
