echo "设置任务栏中位置为底部、图标只在当前工作区显示"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "BOTTOM"
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true

echo "设置硬件时钟"
sudo apt-get install ntpdate
sudo ntpdate time.windows.com
sudo hwclock --localtime --systohc

echo "设置充电上限"
sudo sh -c "echo 80 >/sys/class/power_supply/BAT0/charge_control_end_threshold"

echo "设置git ssh使用443端口"
echo -e "Host github.com\nHostname ssh.github.com\nPort 443\nUser git" >>~/.ssh/config
