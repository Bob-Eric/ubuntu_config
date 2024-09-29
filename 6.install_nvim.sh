echo "安装nvim中"
# 判断CPU架构
ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]; then
    LAZYGIT_ARCH="x86_64"
    BTOP_ARCH="x86_64"
    sudo apt install ./nvim-linux64.deb
elif [[ "$ARCH" == "aarch64" ]]; then
    LAZYGIT_ARCH="arm64"
    BTOP_ARCH="aarch64"
    sudo apt install ./nvim-linux_arm64.deb
fi
echo "安装LazyVim"
git clone https://github.com/Bob-Eric/lazyvim-config.git ~/.config/nvim

echo "安装Lazygit"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_${LAZYGIT_ARCH}.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

echo "安装Lazydocker"
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

echo "安装btop"
curl -Lo btop.tbz "https://github.com/aristocratos/btop/releases/latest/download/btop-${BTOP_ARCH}-linux-musl.tbz"
tar -xvjf btop.tbz
cd btop && sudo make install
cd -

echo "安装NodeJs"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
. ~/.zshrc
nvm install --lts
nvm use --lts

echo "设置sudo下使用nvim"
echo "export SUDO_EDITOR=nvim" >>~/.zshrc
echo "export SUDO_EDITOR=nvim" >>~/.bashrc
