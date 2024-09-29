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
echo -e "Host github.com\nHostname ssh.github.com\nPort 443\nUser git" >>~/.ssh/config
