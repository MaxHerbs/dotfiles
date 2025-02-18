sudo apt-get install ninja-build gettext cmake curl build-essential -y
git clone https://github.com/neovim/neovim.git /tmp/nvim
cd /tmp/nvim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd -
ln -s ~/dotfiles/nvim ~/.config/nvim
