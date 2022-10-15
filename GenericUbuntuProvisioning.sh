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
