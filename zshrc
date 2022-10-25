# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="/home/agriffin/.local/bin:$PATH"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="linuxonly"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
sudo
zsh-syntax-highlighting
fzf
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="/root/.local/bin:$PATH"


alias 'pdigi'='echo "TfoK%55s2#&24%!a"'
alias 'srcz'='source ~/.zshrc'
alias 'ts'='sudo tailscale'
alias 'cip'='curl ifconfig.me/all'
alias 'tss'='sudo tailscale status'
alias 'virc'='sudo vim ~/dotties/zshrc'
alias 'ngcr'='sudo docker cp ~/NGINXconf/default.conf nginx-base:/etc/nginx/conf.d/ && sudo docker exec nginx-base nginx -s reload'
alias 'ngini'='vim ~/NGINXconf/default.conf'

alias 'smh'='python3 ~/Smartaira-noc-tools/smh/smh.py'

alias 'sad'='sudo docker'
alias 'tshee'='sudo tailscale up --ssh --exit-node=100.73.164.92 --exit-node-allow-lan-access=true --accept-risk=lose-ssh'
alias 'tsr'='sudo tailscale up --reset'
alias 'tsh'='sudo tailscale up --ssh --accept-risk=lose-ssh'
alias 'gacp'='git add * && git commit -m "null" && echo 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 && git push'


export PATH="~/Smartaira-noc-tools:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init zsh)"
alias 'ls'='exa'
alias 'cd'='z'
alias 'uu'='sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt full-upgrade -y'
alias 'dkra'='docker restart $(docker ps -a -q)'
alias 'dksa'='docker stop $(docker ps -a -q)'

# FOR NEBLIX-EDGE NAT PREROUTING:
alias 'pfpn'='sudo iptables -t nat -A PREROUTING -d 137.184.3.254 -p tcp --dport 39115 -j DNAT --to-dest 100.74.73.98:32400 && sudo iptables -t nat -A PREROUTING -d 137.184.3.254 -p udp --dport 39115 -j DNAT --to-dest 100.74.73.98:32400'
