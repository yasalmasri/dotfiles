git submodule init
git submodule update

vim +BundleInstall +qall

echo source ~/.dotfiles/vim-for-rails.vim  >> ~/.vimrc
echo source ~/.dotfiles/gvim-for-rails.vim >> ~/.gvimrc
echo source ~/.dotfiles/profile            >> ~/.profile
echo source ~/.dotfiles/profile            >> ~/.bashrc
