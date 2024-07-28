curl -sSL https://steampp.net/Install/Linux.sh | bash

echo "信任证书中"
openssl x509 -inform PEM -in ~/.local/share/Steam++/Plugins/Accelerator/SteamTools.Certificate.cer -out ~/.local/share/Steam++/Plugins/Accelerator/SteamTools.Certificate.crt
sudo cp ~/.local/share/Steam++/Plugins/Accelerator/SteamTools.Certificate.crt /usr/share/ca-certificates
sudo update-ca-certificates
