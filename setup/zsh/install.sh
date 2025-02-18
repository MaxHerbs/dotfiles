sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)
rm -f ~/.zshrc
ln -s ~/dotfiles/zshrc ~/.zshrc
