git submodule init
git submodule update

# vim +BundleInstall +qall
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo source ~/.dotfiles/vim-for-rails.vim  >> ~/.vimrc
echo source ~/.dotfiles/gvim-for-rails.vim >> ~/.gvimrc
echo source ~/.dotfiles/profile            >> ~/.profile
echo source ~/.dotfiles/profile            >> ~/.bashrc

vim +PluingInstall
