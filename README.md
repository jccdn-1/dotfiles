# dotfiles

Personal development environment: **Alacritty · tmux · Zsh (Powerlevel10k) · Neovim**.

Configs are symlinked from this repo into your home directory, so edits live in one
place under version control. Works on **macOS** and **Linux**.

---

## Contents

| Folder        | Symlinks to            | What it is                                  |
|---------------|------------------------|---------------------------------------------|
| `zsh/`        | `~/.zshrc`, `~/.p10k.zsh` | Zsh + oh-my-zsh + Powerlevel10k prompt   |
| `tmux/`       | `~/.tmux.conf`         | tmux (prefix `C-a`) + TPM plugins           |
| `nvim/`       | `~/.config/nvim/`      | Neovim IDE (Lua + lazy.nvim), needs nvim ≥ 0.11 |
| `alacritty/`  | `~/.config/alacritty/` | Alacritty terminal + theme submodule        |

---

## 1. Prerequisites

### macOS

```bash
# Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Core tools
brew install git stow neovim tmux zsh eza zoxide fzf fd bat bun
brew install --cask alacritty font-jetbrains-mono-nerd-font
```

### Linux

Homebrew works on Linux too and is the simplest way to match the macOS setup:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git stow neovim tmux zsh eza zoxide fzf fd bat bun
```

Or use your native package manager (names vary by distro):

```bash
# Debian / Ubuntu
sudo apt update && sudo apt install -y git stow tmux zsh fzf fd-find bat
#   neovim: use the PPA / AppImage / brew to get >= 0.11
#   eza, zoxide, bun: install per their docs (apt versions are often too old)

# Arch
sudo pacman -S git stow neovim tmux zsh eza zoxide fzf fd bat

# Fedora
sudo dnf install git stow neovim tmux zsh fzf fd-find bat
```

Install **Alacritty** and the **JetBrainsMono Nerd Font** from your package
manager or their release pages.

### oh-my-zsh + Powerlevel10k + Zsh plugins (both platforms)

```bash
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# Plugins used by .zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
```

> The oh-my-zsh installer creates a default `~/.zshrc`. Delete or back it up
> before linking this repo's version (Stow will refuse to link over it otherwise).

---

## 2. Clone

```bash
git clone https://github.com/jccdn-1/dotfiles.git ~/dotfiles
cd ~/dotfiles
git submodule update --init --recursive   # fetch alacritty/themes
```

---

## 3. Create the symlinks

### Option A — GNU Stow (recommended for `zsh`, `tmux`, `nvim`)

These three folders mirror your home layout, so Stow links them in one shot:

```bash
cd ~/dotfiles
stow zsh tmux nvim
```

> If Stow reports a conflict (e.g. an existing `~/.zshrc`), move it aside first:
> `mv ~/.zshrc ~/.zshrc.bak` and re-run.

**Alacritty is different** — its files sit at the folder root and must go to
`~/.config/alacritty/`, so link it manually:

```bash
mkdir -p ~/.config
ln -s ~/dotfiles/alacritty ~/.config/alacritty
```

### Option B — plain symlinks (no Stow)

```bash
cd ~/dotfiles
ln -s "$PWD/zsh/.zshrc"          ~/.zshrc
ln -s "$PWD/zsh/.p10k.zsh"       ~/.p10k.zsh
ln -s "$PWD/tmux/.tmux.conf"     ~/.tmux.conf
mkdir -p ~/.config
ln -s "$PWD/nvim/.config/nvim"   ~/.config/nvim
ln -s "$PWD/alacritty"           ~/.config/alacritty
```

---

## 4. First run

```bash
# Zsh: make it your login shell, then open a new terminal
chsh -s "$(which zsh)"
# Powerlevel10k prompt configures on first launch (or run: p10k configure)

# tmux: install TPM, then fetch plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux                # start tmux
# press:  C-a  then  I   → installs sessionx, resurrect, continuum, tmux2k…

# Neovim: plugins + LSP servers install automatically on first launch
nvim                # lazy.nvim bootstraps; Mason installs ts_ls/eslint/lua_ls/prettier/stylua
```

---

## Notes

- **Neovim requires ≥ 0.11** — the LSP setup uses the new `vim.lsp.config` API.
- **Nerd Font required** — set your terminal to *JetBrainsMono Nerd Font* so icons
  render in the prompt, tmux bar, and Neovim.
- Edit configs in `~/dotfiles`; changes apply immediately through the symlinks.
  Reload with `source ~/.zshrc`, `C-a r` (tmux), or restart Neovim.
