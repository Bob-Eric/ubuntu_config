echo "安装LazyVim"
git clone https://github.com/Bob-Eric/lazyvim-config.git ~/.config/nvim

echo "设置默认使用nvim"
if ! grep -q "export EDITOR=nvim" ~/.zshrc; then
  echo "export EDITOR=nvim" >>~/.zshrc
else
  echo ".zshrc中已存在EDITOR=nvim，跳过添加"
fi

if ! grep -q "export EDITOR=nvim" ~/.bashrc; then
  echo "export EDITOR=nvim" >>~/.bashrc
else
  echo ".bashrc中已存在EDITOR=nvim，跳过添加"
fi

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

