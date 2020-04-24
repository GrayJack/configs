# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# This need to be setup before ZSH_THEME for PowerLevel9k theme.
POWERLEVEL9K_MODE='nerdfont-complete'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
# Remove archlinux if not arch based distro or pacBSD
plugins=(
    archlinux
    extract
    cargo
    git
    gitignore
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

# Don't glob if there is no match
setopt NO_NOMATCH

# Add Path to user completions
fpath+=~/.local/share/zsh/site-functions

autoload -Uz compinit
if [ $(date +'%j') != $(date -r ~/.zcompdump +'%j') ]; then
  compinit
else
  compinit -C
fi

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

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
    alias spotify="flatpak run com.spotify.Client"
    alias autenticator="flatpak run com.github.bilelmoussaoui.Authenticator"
    alias psvscreen="mplayer tv:// -tv driver=v4l2:device=/dev/video0:width=1920:height=1080"
    alias psvscreen_safe="mplayer tv:// -tv driver=v4l2:device=/dev/video0:width=960:height=544"
    alias psvscreen_60fps="mplayer tv:// -tv driver=v4l2:device=/dev/video0:width=896:height=504"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
