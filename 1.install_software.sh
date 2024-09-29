sudo apt install vim git python3 curl g++ snap -y
echo "安装solaar罗技驱动及copyq剪切板控制软件"
sudo add-apt-repository ppa:solaar-unifying/stable
sudo apt update
sudo apt install solaar -y

echo "安装星火应用商店"
sudo apt install spark-store_4.2.13.1_amd64.deb
echo "安装clash-verge、linuxqq、microsoft-edge-stable、vscode、网易云音乐"
sudo apt install aptss
sudo aptss install clash-verge linuxqq microsoft-edge-stable code netease-cloud-music todesk copyq
