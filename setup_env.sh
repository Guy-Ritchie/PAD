#!/bin/bash

# Install necessary system dependencies
sudo apt install --yes vim git curl tmux ripgrep fonts-powerline procps zsh
sudo apt install --yes python3 python-is-python3 python3-venv zsh

# Install node-version-manager, to track and manage node-versions
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh" | bash
nvm install --lts

# Installing & setting up vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Installing yarn globall?? (not required, ig!)
# npm install --global --force yarn

# Copying vim config from github profile!
curl -L -o ~/.vim/hotkeys "https://raw.githubusercontent.com/Guy-Ritchie/PAD/main/.vimrc-hotkeys"
curl -L -o ~/.vimrc "https://raw.githubusercontent.com/Guy-Ritchie/PAD/main/.vimrc"

# Installing all of the vim plugins!
vim +PlugInstall +qall

# Install, and setup oh-my-zsh
yes | zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Setup zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# download, and then append ~/.zshrc file contents, which consist of the necessary aliases!
curl -fsSL https://raw.githubusercontent.com/Guy-Ritchie/PAD/refs/heads/main/.zshrc -o ~/.temp_zshrc
cat ~/.temp_zshrc >> ~/.zshrc
rm ~/.temp_zshrc
echo "zshrc aliases updated!i\nMatches found in `~/.zshrc` to start_jupyter_lab"
grep "start_jupyter_lab" ~/.zshrc
echo "printed matches from ~/.zshrc"


# Install `uv` tool
curl -LsSf https://astral.sh/uv/install.sh | sh

# Changing the zsh theme to agnoster!
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="agnoster"/' ~/.zshrc
echo "modifying theme for zsh"
echo "modified theme!"

echo "Switching to `zsh`"
zsh

echo "Completed setting up env!!"
