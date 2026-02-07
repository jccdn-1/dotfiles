DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# Cria symlinks
ln -sf "$DOTFILES/zshrc" ~/.zshrc
ln -sf "$DOTFILES/zsh" ~/.zsh
ln -sf "$DOTFILES/p10k.zsh" ~/.p10k.zsh
ln -sf "$DOTFILES/nvim" ~/.config/nvim
ln -sf "$DOTFILES/alacritty" ~/.config/alacritty

echo "Dotfiles instalados!"
