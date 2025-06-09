# setup i3
sudo apt install i3
sudo apt install i3status dmenu feh lxappearance rofi xclip unzip

mkdir -p /tmp/nerd-fonts-temp && cd /tmp/nerd-fonts-temp
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/0xProto.zip
unzip 0xProto.zip -d 0xProto
mkdir -p  ~/.local/share/fonts/NerdFonts
sudo cp 0xProto/*.ttf ~/.local/share/fonts/NerdFonts/*.ttf
sudo cp ~/.local/share/fonts/NerdFonts/*.ttf /usr/share/fonts/nerdfonts
rm -rf /tmp/nerd-fonts-temp
mkdir -p ~/.config/i3/
mv ./i3/* ~/.config/i3/
chmod +x ~/.config/i3/i3-workspace-setup.sh
chmod +x ~/.config/i3/screen-setup.sh
chmod +x ~/.config/i3/setup-all.sh

mkdir -p ~/.config/i3status/
mv ./i3status/* ~/.config/i3status/

mv ./xprofile ~/.xprofile
mv ./zshrc ~/.zshrc

# setup terminator
mkdir -p ~/.config/terminator/
mv ./terminator/* ~/.config/terminator/

mkdir -p ~/.config/warp-terminal/
mv ./warp-terminal/* ~/.config/warp-terminal/


# setup nvim
git clone https://github.com/neovim/neovim.git
git checkout v0.11.1
make CMAKE_BUILD_TYPE=Release
sudo make install


# prune gnome
sudo apt remove gnome-calendar gnome-characters gnome-sudoku gnome-mahjongg gnome-logs gnome-font-viewer gnome-getting-started-docs gnome-initial-setup gnome-todo
sudo apt purge gedit totem gnome-calculator mousetweaks gnome-menus gnome-terminal
sudo apt autoremove --purge

# install lib for postman
sudo apt install -y libgl1
