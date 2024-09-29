echo "安装zsh中..."
sudo apt install zsh curl gedit -y
sh -c "$(curl -fsSL https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh)" -y
echo "安装zsh插件"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

echo "配置.zshrc中..."
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g' ~/.zshrc


echo "添加ros环境变量"
echo "source /opt/ros/${ROS_DISTRO}/setup.zsh" >> ~/.zshrc

if [ -n "$ROS_DISTRO" ] && [ "$ROS_DISTRO" != "noetic" ]; then
    echo "配置ros2自动补全"
    {
    echo "# argcomplete for ros2 & colcon"
    echo "eval \"\$(register-python-argcomplete3 ros2)\""
    echo "eval \"\$(register-python-argcomplete3 colcon)\""
    } >> ~/.zshrc

    echo "配置colcon build生成环境变量自动补全"
    {
    echo "# argcomplete for ros2 & colcon"
    echo "eval \"\$(register-python-argcomplete3 ros2)\""
    echo "eval \"\$(register-python-argcomplete3 colcon)\""
    } | sudo tee -a $(pip show colcon-zsh | grep Location | cut -d' ' -f2)/colcon_zsh/shell/template/prefix_chain.zsh.em > /dev/null
else
    echo "ROS_DISTRO 环境变量未设置或为 noetic，跳过 ROS 相关配置。"
fi
