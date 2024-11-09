echo "设置任务栏中位置为底部、图标只在当前工作区显示"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "BOTTOM"
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true

echo "设置硬件时钟"
sudo apt-get install ntpdate
sudo ntpdate time.windows.com
sudo hwclock --localtime --systohc

echo "设置充电上限"
curl -o bat https://github.com/tshakalekholoane/bat/releases/download/1.1/bat
chmod +x bat
sudo bat threshold 80
sudo bat persist

echo "设置git ssh使用443端口"
if ! grep -q "Host github.com" ~/.ssh/config; then
  echo -e "Host github.com\nHostname ssh.github.com\nPort 443\nUser git" >>~/.ssh/config
else
  echo "环境变量已存在，跳过添加"
fi

echo "设置git允许非安全协议"
git config --global http.sslVerify false

echo "curl允许非安全协议"
if ! grep -q "insecure" ~/.curlrc; then
  echo -e "insecure" >>~/.curlrc
else
  echo "环境变量已存在，跳过添加"
fi

echo "wget允许非安全协议"
if ! grep -q "check_certificate = off" ~/.wgetrc; then
  echo -e "check_certificate = off" >>~/.wgetrc
else
  echo "环境变量已存在，跳过添加"
fi
