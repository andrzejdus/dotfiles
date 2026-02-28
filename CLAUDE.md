# CLAUDE.md — Dotfiles Repository Guide

This file provides context for AI assistants working in this repository.

## What This Repository Is

Personal dotfiles for **Andrzej Duś**, managed with [chezmoi](https://www.chezmoi.io/). The repository has two parts:

- **Public** (`git@github.com:andrzejdus/dotfiles.git`): This repo — non-sensitive configuration
- **Private** (`git@github.com:andrzejdus/dotfiles-private.git`): Cloned to `~/.local/share/chezmoi-private` — secrets, tokens, sensitive config

Chezmoi applies both source directories to `$HOME` on the target machine.

## Chezmoi File Naming Conventions

Chezmoi uses filename prefixes and suffixes to control how files are deployed. Always respect these when adding or renaming files:

| Prefix/Suffix | Effect |
|---|---|
| `dot_` | Becomes `.` — e.g., `dot_zshrc` → `~/.zshrc` |
| `executable_` | Sets executable bit on the deployed file |
| `private_` | File is kept private (mode 0600) |
| `symlink_` | Creates a symlink instead of copying |
| `.tmpl` suffix | Processed as a Go template before deployment |
| `dot_config/` | Becomes `~/.config/` |

Template files (`.tmpl`) have access to chezmoi data variables. The current template variables, set interactively at `chezmoi init` time, are:

- `{{ .email }}` — user email (used in `dot_gitconfig.tmpl`)
- `{{ .hostname_color }}` — terminal prompt color (set in `.chezmoi.toml.tmpl`)

## Repository Structure

```
dotfiles/
├── .chezmoi.toml.tmpl          # chezmoi config template (prompts for email, hostname_color)
├── .chezmoiignore              # Files chezmoi ignores (README.md)
├── dot_gitconfig.tmpl          # ~/.gitconfig (templated for email)
├── dot_zshrc                   # ~/.zshrc — zsh shell config
├── dot_vimrc                   # ~/.vimrc — vim config
├── dot_wezterm.lua             # ~/.wezterm.lua — WezTerm terminal config
├── dot_screenrc                # ~/.screenrc — GNU screen config
├── dot_ansible-shell-packages.yml  # ~/.ansible-shell-packages.yml — Ansible playbook
├── dot_oh-my-zsh/              # ~/.oh-my-zsh/ (custom oh-my-zsh files)
├── dot_vim/                    # ~/.vim/
├── bin/                        # ~/bin/ — helper scripts
│   ├── executable_prepare_shell     # Bootstrap: installs oh-my-zsh, zsh plugins, chezmoi init
│   ├── executable_install_shell_tools  # Runs ansible playbook for package install
│   ├── executable_update-all        # SSH into remotes and run apt/yum upgrade
│   ├── executable_djirmjpg          # Delete JPGs that have a matching DNG file
│   └── executable_dupes_by_size     # Find duplicate files sorted by size (uses fdupes)
└── dot_config/                 # ~/.config/
    ├── hypr/                   # Hyprland WM config
    │   ├── hyprland.conf       # Main Hyprland config
    │   ├── keybindings.conf    # Keybindings (sourced by hyprland.conf)
    │   ├── hypridle.conf       # Idle/lock/sleep timeouts
    │   ├── hyprlock.conf       # Lock screen config
    │   └── hyprpaper.conf      # Wallpaper config
    ├── waybar/                 # Waybar status bar
    │   ├── config.jsonc        # Bar layout and module config
    │   ├── style.css           # Bar styling
    │   └── mocha.css           # Catppuccin Mocha color palette
    ├── kitty/                  # Kitty terminal config
    │   ├── kitty.conf          # Main kitty config
    │   └── symlink_theme.conf  # Symlink to active theme
    ├── nvim/                   # Neovim config
    │   └── init.vim_           # Neovim init (disabled, rename to init.vim to activate)
    ├── zed/                    # Zed editor config
    │   ├── private_settings.json  # Zed settings (private)
    │   └── keymap.json         # Zed keybindings
    └── private_htop/           # htop config (private)
        └── private_htoprc
```

## Key Configuration Choices

### Shell (zsh + oh-my-zsh)
- **Theme**: `agnoster` (requires Powerline/Nerd fonts — JetBrainsMono Nerd Font recommended)
- **Plugins**: `git`, `web-search`, `zsh-autosuggestions`, `zsh-syntax-highlighting`, `history-substring-search`, `vi-mode`
- **Editor**: Prefers `nvim` if available, falls back to `vim`; `$EDITOR` is set accordingly
- **Key aliases**: `cz` = chezmoi, `la` = ls -la, `z` = zeditor, `n` = nnn, `v` = vim/nvim
- `exa`/`eza` replaces `ls` if available; `bat` replaces `cat` if available
- Loads `~/.env` at the end if it exists (for local secrets)
- Supports `nvm`, `sdkman`, `krew` (Kubernetes plugin manager)

### Terminal Emulators
- **kitty**: Primary terminal — JetBrainsMono Nerd Font, 12pt, 0.95 opacity, 20000 line scrollback, F1 opens new tab, F2 opens new window
- **WezTerm**: Cross-platform (includes WSL/Windows support), Solarized dark, 0.95 opacity, 120×28 default size

### Window Manager (Hyprland — Linux/Wayland only)
- **Layout**: Dwindle tiling
- **Modifier key**: `SUPER` (Windows key)
- **Key apps**: kitty (terminal), nautilus (files), rofi (launcher), Vivaldi (browser)
- **Autostart**: hyprpaper, hypridle, waybar, wl-paste (clipboard history)
- **Input**: Custom keyboard layout `custom`/`superlsgt`, Caps Lock remapped to Escape
- **Idle timeouts**: dim at 2.5min, lock at 5min, screen off at 5.5min, suspend at 10min
- **Screenshots**: `Print` = region, `Shift+Print` = window, `Alt+Print` = monitor (uses hyprshot)

### Waybar Modules (left → right)
`workspaces | window title || network | bluetooth | audio | cpu | temperature | memory | battery | clock`

### Git
- Author name hardcoded as `Andrzej Duś`; email comes from chezmoi template variable
- Push default: `upstream` with `autoSetupRemote = 1`
- No pager for `branch`, `log`, `diff`
- git-lfs enabled
- Aliases: `st` (status), `co` (checkout), `ci` (commit -v), `lg` (graph log)

### Editors
- **vim**: Desert colorscheme, 4-space tabs, no swap files, arrow keys remapped (up/down scroll, left/right disabled), leader = `,`
- **Zed**: Vim mode enabled, One Dark/Light theme, GPT-5 as default AI model, format-on-save disabled

## Installation Workflow

```sh
# 1. Set up SSH key for GitHub access (required)

# 2. Install zsh and git
sudo pacman -Syu zsh git    # Arch
sudo apt install zsh git    # Debian/Ubuntu
sudo dnf install zsh git    # Fedora

# 3. Change default shell
chsh username               # select /bin/zsh

# 4. Install chezmoi
sudo pacman -S chezmoi      # Arch
sudo snap install chezmoi   # other

# 5. Run bootstrap script (installs oh-my-zsh, plugins, initializes both chezmoi repos)
curl -sfL https://git.io/JkIKE | sh
# or directly:
~/bin/prepare_shell

# 6. Apply dotfiles
chezmoi apply
# Also apply private repo:
chezmoi -S .local/share/chezmoi-private apply

# 7. [Optional] Install terminal tools via Ansible
~/bin/install_shell_tools
```

## Making Changes

### Editing a deployed file via chezmoi
```sh
cz edit ~/.zshrc            # opens the source file in $EDITOR
cz apply                    # deploy changes to $HOME
```

### Adding a new dotfile
```sh
cz add ~/.config/some/file
```

### Checking what would change
```sh
cz diff
```

### Common chezmoi operations
```sh
cz status                   # show which managed files differ
cz cd                       # cd into the chezmoi source directory
cz re-add                   # re-add all managed files from $HOME
```

## Ansible Package Management

`dot_ansible-shell-packages.yml` installs these tools on any machine:

`zsh`, `neovim`, `htop`, `btop`, `bat`, `fd`, `ripgrep`, `nnn`, `mc`, `tldr`, `curl`, `wget`, `links`, `git`, `keychain`, `dust`, `eza`

Run with: `~/bin/install_shell_tools` (requires `ansible-playbook` to be installed, prompts for sudo password via `-K`).

## Conventions to Follow

- **Do not commit secrets.** Sensitive files belong in the private repo and use the `private_` prefix.
- **Use chezmoi prefixes correctly.** A file deployed to `~/.config/foo` must be at `dot_config/foo` in this repo.
- **Templates use Go template syntax** (`{{ .variable }}`). New template variables must be added to `.chezmoi.toml.tmpl` with a `promptString` call.
- **Scripts in `bin/` must have the `executable_` prefix** so chezmoi sets the executable bit.
- **Hyprland keybindings go in `keybindings.conf`**, not `hyprland.conf` — the main config sources that file.
- **Kitty themes** use a symlink (`symlink_theme.conf`) pointing to a theme file from the kitty-themes collection.
- **The `.chezmoiignore` file** currently only ignores `README.md`. Add other files here if they should not be managed by chezmoi.
