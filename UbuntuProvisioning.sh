# Initial updates and kernel upgrades
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt full-upgrade -y

# Install tailscale, start tailscale service, and init tailscale SSH
curl -fsSL https://tailscale.com/install.sh | sh -y
sudo tailscale up --ssh --accept-risk=lose-ssh

# Install ZSH and OhMyZSH
sudo apt-get install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo apt-get install zoxide exa ripgrep fzf bat tldr -y

# Symlinking ~/.zshrc to xxx/dotties/zshrc
rm ~/.zshrc
ln -s ~/dotties/zshrc ~/.zshrc


sudo apt-get install docker docker-compose -y

# Networking tools
sudo apt-get install net-tools -y
sudo apt-get install iperf3 -y
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash -y
sudo apt-get install speedtest -y

# tldr update
tldr --update



