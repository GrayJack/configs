export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# This need to be setup before ZSH_THEME for PowerLevel9k theme.
POWERLEVEL9K_MODE='nerdfont-complete'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
# Remove archlinux if not arch based distro or pacBSD
plugins=(
    archlinux
    extract
    git
    history
    history-substring-search
    jump
    lol
    sudo
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
    z
)

autoload -Uz compinit
if [ $(date +'%j') != $(date -r ~/.zcompdump +'%j') ]; then
  compinit
else
  compinit -C
fi

source $ZSH/oh-my-zsh.sh

# User configuration

# Import other config files
source /home/grayjack/.zshenv # Environment variable/function and powerlevel9k config
source /home/grayjack/.zsettings.zsh # Settings of other plugins

# Rehash every time
#zstyle ':completion:*' rehash true

# On demand rehash
# Setup instruction on: https://wiki.archlinux.org/index.php/Zsh#On-demand_rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd


# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
if [[ "$OSTYPE" == linux* ]]; then
    alias clean-cache="echo 3 | sudo tee /proc/sys/vm/drop_caches"
    alias restart-bluetooth="sudo systemctl restart bluetooth"
    alias get-gpu="glxinfo | rg 'server glx vendor string'"
    alias emacs-nw="emacs -nw"
fi
