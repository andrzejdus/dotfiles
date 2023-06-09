dotfiles
=============
My precious shell configuration files. :sunglasses:

# Installation

### Set up your private key
Example location `~/.ssh/id_rsa`

### Install required tools
```sh
sudo pacman -Syu zsh git
```
or
```sh
sudo apt install zsh git
```
or
```sh
sudo dnf install zsh git
```

### Set zsh as active shell
```sh
chsh username
```
### Install chezmoi

Install [chezmoi](https://github.com/twpayne/chezmoi) by following their [installation instruction]([https://github.com/twpayne/chezmoi/blob/master/docs/INSTALL.md](https://www.chezmoi.io/install/)) (notice that if you are using their install script it installs itself in .bin)

### Install additional scripts (including oh-my-zsh) and initalize chezmoi

```sh
curl -sfL https://git.io/JkIKE | sh
```

### Run chezmoi apply

```sh
chezmoi apply
```

### [optional] Install shell tools with ansible

```sh
~/bin/install_shell_tools
```

After next login everything should work.

# Useful stuff
* [Quick start - chezmoi - documentation](https://www.chezmoi.io/quick-start/)

# What's in there?

* zsh
* oh-my-zsh with [agnoster](https://github.com/agnoster/agnoster-zsh-theme) theme that uses powerline fonts (check nerdfont)
* [chezmoi](https://github.com/twpayne/chezmoi)
