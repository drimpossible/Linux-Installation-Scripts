sudo apt-get install zsh
# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "Press ENTER after changing the ZSH_THEME in ~/.zshrc"
read
 # fonts for zsh
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
echo "Select the font of terminal from Edit -> Profile Preferences -> Custom Font"
read
