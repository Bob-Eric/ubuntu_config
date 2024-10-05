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

echo "设置sudo下使用nvim"
if ! grep -q "export SUDO_EDITOR=nvim" ~/.zshrc; then
    echo "export SUDO_EDITOR=nvim" >>~/.zshrc
else
    echo ".zshrc中已存在SUDO_EDITOR=nvim，跳过添加"
fi

if ! grep -q "export SUDO_EDITOR=nvim" ~/.bashrc; then
    echo "export SUDO_EDITOR=nvim" >>~/.bashrc
else
    echo ".bashrc中已存在SUDO_EDITOR=nvim，跳过添加"
fi