# Using a Node.js base image
FROM node:20-slim

# Install necessary packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade && apt-get install --yes python3 python-is-python3 python3-venv zsh git vim tmux curl sudo && apt-get clean
RUN DEBIAN_FRONTEND=noninteractive apt-get install --yes ripgrep fonts-powerline procps && apt-get clean

# Create a new user `rinzler` with password `r`
RUN useradd -m -s /usr/bin/zsh rinzler
RUN echo "rinzler:r" | chpasswd

# Add `rinzler` to sudo group
RUN usermod -aG sudo rinzler

# Add yarn globally
RUN DEBIAN_FRONTEND=noninteractive npm install --global --force yarn

# Switch to `rinzler` user
USER rinzler
WORKDIR /home/rinzler
RUN DEBIAN_FRONTEND=noninteractive curl -L -o .vim/hotkeys https://raw.githubusercontent.com/Guy-Ritchie/PAD/main/.vimrc-hotkeys
RUN DEBIAN_FRONTEND=noninteractive curl -L -o .vimrc https://raw.githubusercontent.com/Guy-Ritchie/PAD/main/.vimrc

RUN DEBIAN_FRONTEND=noninteractive zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

# EXPOSE Port(s) (8888) to access services run inside container
EXPOSE 8888

# Start shell, and use it.
CMD ["/bin/zsh"]
