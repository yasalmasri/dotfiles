git submodule init
git submodule update

# vim +BundleInstall +qall
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c "execute \"PluginInstall\" | qa"

echo source ~/.dotfiles/vimrc.vim  >> ~/.vimrc
echo source ~/.dotfiles/gvim-for-rails.vim >> ~/.gvimrc
echo source ~/.dotfiles/profile            >> ~/.profile
echo source ~/.dotfiles/profile            >> ~/.bashrc
echo source ~/.dotfiles/zsh                >> ~/.zshrc
git config --global core.excludesfile ~/.dotfiles/gitignore_global
git config --global core.editor `which vim`
