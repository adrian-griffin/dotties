echo 'Make sure the dotties dir is in /home/agriffin/'

# Initial updates and kernel upgrades
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt full-upgrade -y

# Install tailscale, start tailscale service, and init tailscale SSH
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --ssh --accept-risk=lose-ssh

# Install ZSH and OhMyZSH
sudo apt-get install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install syntax-highlighting, autosuggestions, and fzf
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
sudo apt-get install fzf

# Symlinking ~/.zshrc to xxx/dotties/zshrc
ln /home/agriffin/.zshrc /home/agriffin/dotties/zshrc

# Docker Engine install
sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

sudo apt-get install docker-compose -y

# Networking tools
sudo apt-get install net-tools -y
sudo apt-get install iperf3 -y
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
sudo apt-get install speedtest -y

# Bat install
sudo apt-get install bat -y

# Zoxide install 
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# exa install
sudo apt-get install exa -y

# tldr install
sudo apt-get install tldr -y
tldr --update

# ripgrep install
sudo apt-get install ripgrep -y


# Nerd font install
#wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Hack.zip
#unzip Hack.zip -d ~/.fonts
#fc-cache -fv

# Starship install
#curl -sS https://starship.rs/install.sh | sh

# Starship configuration
#mkdir -p ~/.config && touch ~/.config/starship.toml


# LazyDocker install
#docker run --rm -it -v \
#/var/run/docker.sock:/var/run/docker.sock \
#-v /home/agriffin/LAZYDOCKER/:/.config/jesseduffield/lazydocker \
#lazyteam/lazydocker



