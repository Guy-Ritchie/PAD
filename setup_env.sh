#!/bin/bash

# Helper functions for logging with colors
log_info() {
    echo -e "\033[1;34m[INFO] $1\033[0m"
}

log_success() {
    echo -e "\033[1;32m[SUCCESS] $1\033[0m"
}

log_error() {
    echo -e "\033[1;31m[ERROR] $1\033[0m"
}

# Start of the script
log_info "0. Starting environment setup..."

# Install necessary system dependencies
log_info "1. Installing necessary system dependencies..."
sudo apt install --yes vim git curl tmux ripgrep fonts-powerline procps zsh
sudo apt install --yes python3 python-is-python3 python3-venv zsh
log_success "1. System dependencies installed successfully."

# Install node-version-manager, to track and manage node-versions
log_info "2. Installing Node Version Manager (nvm)..."
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh" | bash
log_success "2. nvm installed successfully."

# Install Node.js LTS version
log_info "2a. Installing Node.js LTS version..."
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install --lts
log_success "2a. Node.js LTS version installed successfully."

# Installing & setting up vim-plug
log_info "3. Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
log_success "3. vim-plug installed successfully."

# Copying vim config from GitHub profile
log_info "4. Copying vim configuration files from GitHub..."
curl -L -o ~/.vim/hotkeys "https://raw.githubusercontent.com/Guy-Ritchie/PAD/main/.vimrc-hotkeys"
curl -L -o ~/.vimrc "https://raw.githubusercontent.com/Guy-Ritchie/PAD/main/.vimrc"
log_success "4. Vim configuration files copied."

# Installing all of the vim plugins
log_info "4a. Installing Vim plugins..."
vim +PlugInstall +qall
log_success "4a. Vim plugins installed successfully."

# Install and set up oh-my-zsh
log_info "5. Installing and setting up oh-my-zsh..."
yes | zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
log_success "5. oh-my-zsh installed successfully."

# Set up zsh-autosuggestions
log_info "5a. Setting up zsh-autosuggestions plugin..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
log_success "5a. zsh-autosuggestions plugin set up."

# Download and append ~/.zshrc file contents (aliases, etc.)
log_info "5b. Updating zshrc with custom aliases..."
curl -fsSL https://raw.githubusercontent.com/Guy-Ritchie/PAD/refs/heads/main/.zshrc -o ~/.temp_zshrc
cat ~/.temp_zshrc >> ~/.zshrc
rm ~/.temp_zshrc
log_success "5b. zshrc aliases updated."

# Install the `uv` tool
log_info "6. Installing uv tool..."
curl -LsSf https://astral.sh/uv/install.sh | sh
log_success "6. uv tool installed successfully."

# Change the zsh theme to agnoster
log_info "7. Changing zsh theme to agnoster..."
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="agnoster"/' ~/.zshrc
log_success "7. Zsh theme changed to agnoster."

# Switch to zsh shell
log_info "8. Switching to zsh..."
zsh
log_success "8. Switched to zsh shell."

# Completed setup message
log_success "Environment setup completed successfully!"

