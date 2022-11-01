

cd ~

sudo apt-get install curl

sudo apt-get update -y && sudo apt-get upgrade -y

sudo apt full-upgrade -y

eth0ip=$(ip -4 a | grep eth0 | grep 'inet' | awk '{print $2}' | awk 'NR%2' | cut -f1 -d"/")

echo Current eth0 IPv4: $eth0ip

echo -------------------------------------------------------------------------------------

curl -fsSL https://tailscale.com/install.sh | sh

sudo tailscale up --authkey tskey-auth-kia6cw1CNTRL-ywPjHSFMaP5bWVTBTisaM5t4EJmuk4xv --ssh --accept-risk=lose-ssh

tailipv4=$(sudo tailscale ip -4)

echo Current Tailscale IPv4: $tailipv4

echo -------------------------------------------------------------------------------------

sudo apt-get install zsh -y

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

echo "\n"
echo "\n"
\n
\n

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

sudo apt-get install fzf tldr exa bat ripgrep zoxide -y

sudo rm ~/.zshrc

sudo apt-get install git -y

git clone https://github.com/adrian-griffin/dotties.git

cd ~/dotties && ln -s ~/dotties/zshrc ~/.zshrc

sudo apt-get install docker -y && sudo apt-get install docker-compose -y

sudo apt-get install net-tools -y
sudo apt-get install iperf3 -y
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
sudo apt-get install speedtest -y

cd ~/dotties/LZD/ && sudo docker-compose up -d && cd ~/dotties

sudo docker ps

echo ---------------------

sudo docker ps -a


