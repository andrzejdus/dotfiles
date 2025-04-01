dotfiles
=============
My precious shell configuration files. :sunglasses:

# Installation

## TL;DR
* set up private key for repository access (trust your past self and really don't sikp that step)
* install `zsh`
* change shell to zsh `chsh username`
* install `chezmoi`
* download and initialize dotfiles `curl -sfL https://git.io/JkIKE | sh`
* apply chezmoi `chezmoi apply`

## Detailed installation steps

### Dotfiles repository access
Set up your private key and configure write access to dotfiles repository (otherwise chezmoi init will fail).

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

Install [chezmoi](https://github.com/twpayne/chezmoi)
```sh
sudo pacman -S chezmoi
```
or
```sh
sudo snap install chezmoi
```
or by following their [installation instruction]([https://github.com/twpayne/chezmoi/blob/master/docs/INSTALL.md](https://www.chezmoi.io/install/)) (notice that if you are using their install script it installs itself in .bin)

### Install additional scripts (including oh-my-zsh) and initalize chezmoi

```sh
curl -sfL https://git.io/JkIKE | sh
```
Make sure you have correct access rights to this repository.

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
* oh-my-zsh with [agnoster](https://github.com/agnoster/agnoster-zsh-theme) theme that uses powerline fonts (check [nerdfont](https://github.com/ryanoasis/nerd-fonts))
* [chezmoi](https://github.com/twpayne/chezmoi)
