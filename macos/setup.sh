mkdir -p ~/utilities

mv ./pwdx_for_mac.sh ~/utilities/pwdx_for_mac.sh
mv ./clean_cache.sh ~/utilities/clean_cache.sh

# install font for lazyvim
mkdir -p ~/Downloads/nerd-fonts-temp && cd ~/Downloads/nerd-fonts-temp
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/0xProto.zip
unzip 0xProto.zip -d 0xProto
sudo cp 0xProto/*.ttf ~/Library/Fonts
rm -rf ~/Downloads/nerd-fonts-temp