echo "安装zsh中..."
sudo apt install zsh curl gedit -y
sh -c "$(curl -fsSL https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh)" -y
echo "安装zsh插件"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

echo "配置.zshrc中..."
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g' ~/.zshrc

echo "检查.zshrc中是否已存在ros环境变量"
if ! grep -q "source /opt/ros/${ROS_DISTRO}/setup.zsh" ~/.zshrc; then
    echo "添加ros环境变量"
    echo "source /opt/ros/${ROS_DISTRO}/setup.zsh" >> ~/.zshrc
else
    echo "ros环境变量已存在，跳过添加"
fi

if [ -n "$ROS_DISTRO" ] && [ "$ROS_DISTRO" != "noetic" ]; then
    echo "检查.zshrc中是否已存在ros2自动补全"
    if ! grep -q "eval \"\$(register-python-argcomplete3 ros2)\"" ~/.zshrc; then
        echo "配置ros2自动补全"
        {
        echo "# argcomplete for ros2 & colcon"
        echo "eval \"\$(register-python-argcomplete3 ros2)\""
        echo "eval \"\$(register-python-argcomplete3 colcon)\""
        } >> ~/.zshrc
    else
        echo "ros2自动补全已存在，跳过添加"
    fi

    echo "检查colcon build生成环境变量自动补全是否已存在"
    if ! grep -q "eval \"\$(register-python-argcomplete3 colcon)\"" $(pip show colcon-zsh | grep Location | cut -d' ' -f2)/colcon_zsh/shell/template/prefix_chain.zsh.em; then
        echo "配置colcon build生成环境变量自动补全"
        {
        echo "# argcomplete for ros2 & colcon"
        echo "eval \"\$(register-python-argcomplete3 ros2)\""
        echo "eval \"\$(register-python-argcomplete3 colcon)\""
        } | sudo tee -a $(pip show colcon-zsh | grep Location | cut -d' ' -f2)/colcon_zsh/shell/template/prefix_chain.zsh.em > /dev/null
    else
        echo "colcon build生成环境变量自动补全已存在，跳过添加"
    fi
else
    echo "ROS_DISTRO未设置或为noetic，跳过ros2配置"
fi
