dotfiles
=============
My precious bash configuration files. :sunglasses:

# Installation

### Set up your private key
Example location `~/.ssh/id_rsa`

### Install zsh
```sh
sudo pacman -Syu zsh
```
or
```sh
sudo apt install zsh
```
or
```sh
sudo dnf install zsh
```

### Set zsh as active shell
```sh
chsh username
```
### Install chezmoi

Install [chezmoi](https://github.com/twpayne/chezmoi) by following their [installation instruction]([https://github.com/twpayne/chezmoi/blob/master/docs/INSTALL.md](https://www.chezmoi.io/install/)) (notice that if you are using their install script it installs itself in .bin so beware where you are running their install script)

### Install additional scripts (including oh-my-zsh) and initalize chezmoi

```sh
curl -sfL https://git.io/JkIKE | sh
```

### Run chezmoi apply

```sh
chezmoi apply
```

### [optional] Install shell packages with ansible

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
