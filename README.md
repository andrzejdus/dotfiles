dotfiles
=============
My precious bash configuration files. :sunglasses:

# Installation

You have to install zsh and [chezmoi](https://github.com/twpayne/chezmoi) manually.

You may instal zsh from package (remember to set it as active sheel)
```sh
sudo apt install zsh
```
and chezmoi by following their [INSTALL.md](https://github.com/twpayne/chezmoi/blob/master/docs/INSTALL.md) (notice that if you are using their install script it installs itself in .bin so beware where you are running their install script)

Then install additional scripts (including oh-my-zsh) using following command:

```sh
curl -sfL https://git.io/JkIKE | sh
```

After next login everything should work.

# useful stuff
* [Quick start - chezmoi - documentation](https://www.chezmoi.io/quick-start/)

# What's in there?

* zsh
* oh-my-zsh with [agnoster](https://github.com/agnoster/agnoster-zsh-theme) theme that uses powerline fonts (check nerdfont)
* [chezmoi](https://github.com/twpayne/chezmoi)
