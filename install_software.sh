sudo rm /etc/apt/sources.list.d/ros-fish.list
gpg --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
gpg --export C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 | sudo tee /usr/share/keyrings/ros.gpg > /dev/null
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/ros.gpg] https://mirrors.ustc.edu.cn/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
echo "成功删除清华ROS源并添加中科大ROS源"
sudo apt install vim git python3 g++ snap -y
echo "安装Vscode中..."
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
sudo apt install ./code*.deb
echo "设置任务栏中位置为底部、图标只在当前工作区显示"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "BOTTOM"
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true
echo "安装solaar罗技驱动及copyq剪切板控制软件"
sudo add-apt-repository ppa:solaar-unifying/stable
sudo apt update
sudo apt install copyq solaar -y
echo "安装zsh插件"
bash ./install_onmyzsh.sh
git clone https://gitee.com/yaozhijin/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://gitee.com/yaozhijin/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
chsh -s /bin/zsh 
cp ./.bashrc ~/.bashrc
cp ./.zshrc ~/.zshrc
