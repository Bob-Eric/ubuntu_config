echo "安装nvim中"
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim
git clone https://github.com/Bob-Eric/ubuntu_config.git ~/.config/nvim

echo "安装Lazygit"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

echo "安装NodeJs"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
. ~/.zshrc
nvm install --lts
nvm use --lts

echo "设置sudo下使用nvim"
echo "export SUDO_EDITOR=nvim" >>~/.zshrc
echo "export SUDO_EDITOR=nvim" >>~/.bashrc
