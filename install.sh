/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install powerlevel10k
brew install --cask wezterm macvim font-hack-nerd-font

brew install postgresql
brew services start postgresql

brew install neovim gh lazygit lazydocker tmux


echo source ~/.dotfiles/vimrc.vim >> ~/.vimrc
echo source ~/.dotfiles/zsh >> ~/.zshrc

ln -s /Users/$(whoami)/.dotfiles/config/nvim /Users/$(whoami)/.config
ln -s /Users/$(whoami)/.dotfiles/config/wezterm /Users/$(whoami)/.config

git config --global core.excludesfile ~/.dotfiles/gitignore_global
git config --global core.editor `which vim`


# vim +BundleInstall +qall
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c "execute \"PluginInstall\" | qa"
