sudo apt install git curl python3-pip python3-venv exuberant-ctags ack-grep
pip3 install pynvim flake8 pylint isort --user
pip3 install distro
sudo add-apt-repository --yes ppa:neovim-ppa/stable 
sudo apt-get update
sudo apt-get install neovim
sudo apt-get install python3-neovim
sudo apt-get install htop
sudo apt-get install ncdu
sudo apt-get install bat
sudo apt install zsh

sudo add-apt-repository --yes ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install lazygit

sudo apt install nvtop

sudo apt-get install caca-utils highlight atool w3m poppler-utils mediainfo

sudo apt-get install zsh
mkdir -p ~/.config/.zsh/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/.zsh/zsh-autosuggestion
chsh -s /usr/bin/zsh

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# check node
git clone https://github.com/hut/ranger.git
cd ranger
sudo make install

sudo pip3 install ueberzug

# set preview_images_method ueberzug
