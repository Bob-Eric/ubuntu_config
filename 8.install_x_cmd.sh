echo "安装x-cmd"
eval "$(curl https://get.x-cmd.com)"

echo "安装asdf"
x install asdf

echo "安装lazygit"
x asdf use lazygit
echo "安装zellij"
x asdf use zellij
echo "安装btop"
x asdf use btop

echo "安装ripgrep"
x install

echo "安装lazydocker"
x install lazydocker
echo "安装yazi"
x install yazi

echo "安装ripgrep"
x asdf use ripgrep

echo "安装7z"
sudo apt install p7zip-full -y

echo "配置yazi默认编辑器"
if ! grep -q "EDITOR" ~/.bashrc; then
  echo "export EDITOR=nvim" >>~/.bashrc
else
  echo "环境变量已存在，跳过添加"
fi
if ! grep -q "EDITOR" ~/.zshrc; then
  echo "export EDITOR=nvim" >>~/.zshrc
else
  echo "环境变量已存在，跳过添加"
fi
