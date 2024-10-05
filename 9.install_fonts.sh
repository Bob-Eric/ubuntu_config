curl -Lo CascadiaCode.tar.xz "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.tar.xz"
sudo mkdir -p /usr/share/fonts/CascadiaCode
sudo tar -xvJf CascadiaCode.tar.xz -C /usr/share/fonts/CascadiaCode
cd /usr/share/fonts/CascadiaCode
sudo mkfontscale
sudo mkfontdir
sudo fc-cache -fv
