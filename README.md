# ❄️ My NixOS Config/Dotfiles

[![NixOS 21.05](https://img.shields.io/badge/NixOS-v21.05-blue.svg?style=flat&logo=NixOS&logoColor=white)](https://nixos.org)
![GitHub](https://img.shields.io/github/license/noe-tarbouriech/nix-config)
![GitHub last commit](https://img.shields.io/github/last-commit/noe-tarbouriech/nix-config)

My dotfiles/NixOS config repo which uses GNU Makefiles and Nix language. It is used by both my laptop and my desktop in order to keep unformity between my devices.

> /!\ still a WIP

## What is NixOS ?

NixOS is a linux distribution which uses a statically typed configuration to define itself.

## Usage

- Install NixOS minimal ISO image (tutorial)

- Clone the repo inside a folder in `$HOME` like `~/dots/`

Those dotfiles work using the `make` command; 

| command           | description                                              |
|------------------ | -------------------------------------------------------- |
| `make init`       | symlink config files and install home-manager            |
| `make` (`update`) | `git pull` and rebuild the config using `nixos-rebuild`  |
| `make push`       | basically push configs to git                            |
| `make clear`      | clear pre-existent config                                |

Every single command is documented in the `Makefile`.


## ToDo

### Near future

- [ ] Add the rest of the config like neovim, gaming, etc...
- [ ] Rofi power menu
- [ ] Colorscheme
- [ ] Improving sxhkd and dunst config
- [ ] Switch from alacritty to urxvt
- [ ] Configure lightdm better

### One day maybe ?

- [x] Automating setup using Makefiles
- [ ] Implementing Nix Flakes in my config
- [ ] Tidying things up (maybe ?)

## License

Everything is under the [MIT LICENSE](LICENSE). Feel free to copy stuff over to your own config.
