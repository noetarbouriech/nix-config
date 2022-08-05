CONFIG_PATH=$(dirname "$0")

# cleanup
unlink ~/.config/nvim
rm ~/bin/update

# nvim config
ln -s $CONFIG_PATH/modules/essentials/neovim/nvim-config ~/.config/nvim

# update shortcut
mkdir -p ~/bin
echo "doas nixos-rebuild switch --flake $CONFIG_PATH#\$1" > ~/bin/update
chmod +x ~/bin/update
