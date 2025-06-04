# setup i3
mkdir -p ~/.config/i3/
mv ./i3_config ~/.config/i3/config

mv ./xprofile ~/.xprofile
mv ./zshrc ~/.zshrc

# setup terminator
mv ./terminator_config ~/.config/terminator/config

# setup nvim
git clone https://github.com/neovim/neovim.git
git checkout v0.11.1
make CMAKE_BUILD_TYPE=Release
make CMAKE_BUILD_TYPE=Release


# prune gnome
sudo apt remove gnome-calendar gnome-characters gnome-sudoku gnome-mahjongg gnome-logs gnome-font-viewer gnome-getting-started-docs gnome-initial-setup gnome-todo
sudo apt purge gedit totem gnome-calculator mousetweaks gnome-menus gnome-terminal
sudo apt autoremove --purge

# install lib for postman
sudo apt install -y libgl1
