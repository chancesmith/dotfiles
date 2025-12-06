## Dotfiles setup

### Initial setup on a new machine

1. **Clone the dotfiles repository**

   ```bash
   git clone https://github.com/chancesmith/dotfiles.git ~/dotfiles
   ```

2. **Install stow** (if not already installed)

   ```bash
   brew install stow
   ```

3. **Stow all dotfiles**

   ```bash
   cd ~/dotfiles && stow -vSt ~ */
   ```

   Or to stow individual packages:

   ```bash
   cd ~/dotfiles && stow -vSt ~ act git hammerspoon vim zsh aerospace
   ```

4. **Install Hammerspoon**

   - Download the [latest version of Hammerspoon](https://github.com/Hammerspoon/hammerspoon/releases)
   - Move to Applications/
   - Launch it and grant necessary permissions

5. **Reload shell**
   ```bash
   exec zsh
   ```

### Managing individual packages

If you need to stow or unstow a specific directory:

```bash
cd ~/dotfiles
stow -vSt ~ hammerspoon  # Stow hammerspoon
stow -vD -t ~ vim        # Unstow vim
```
