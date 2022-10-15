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

# Symlinking ~/.zshrc and ?/dotties/zshrc
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

# LazyDocker install



docker run --rm -it -v \
/var/run/docker.sock:/var/run/docker.sock \
-v /yourpath:/.config/jesseduffield/lazydocker \
lazyteam/lazydocker
