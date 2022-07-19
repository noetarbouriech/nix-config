# ❄️ My NixOS Config/Dotfiles

[![NixOS unstable](https://img.shields.io/badge/NixOS-unstable-blue.svg?style=flat&logo=NixOS&logoColor=white)](https://nixos.org)
![GitHub](https://img.shields.io/github/license/noe-tarbouriech/nix-config)
![GitHub last commit](https://img.shields.io/github/last-commit/noe-tarbouriech/nix-config)

My dotfiles/NixOS config repo which uses Nix language and Nix flakes. It is used by both my laptop and my desktop in order to keep uniformity between my devices.

## Usage

- Install NixOS minimal ISO image (tutorial)

- Clone the repo inside a folder in `$HOME` like `~/nix/`

- Use the following command to install the config

```shell
sudo nixos-rebuild switch --flake .#DEVICE_NAME
```

## Current devices

- Thinkpad
- Desktop

## Documentation

![Installation](/doc/installing-nixos.md)

## Thanks to

- [sioodmy's dotfiles](https://github.com/sioodmy/dotfiles)
- [Matthias Benaets's nixos-config](https://github.com/MatthiasBenaets/nixos-config)
- [notusknot's dotfiles-nix](https://github.com/notusknot/dotfiles-nix)

## Old config

Can be found in `old` branch

## License

Everything is under the [MIT LICENSE](LICENSE). Feel free to copy stuff over to your own config.
