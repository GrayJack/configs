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
    git-extra
    history
    history-substring-search
    lol
    sudo
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# ssh keys
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
if [[ "$OSTYPE" == linux* ]]; then
    alias clean-cache="echo 3 | sudo tee /proc/sys/vm/drop_caches"
    alias restart-bluetooth="sudo systemctl restart bluetooth"
fi

# Library path for some programs
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM

# Path to programs
# export PATH=/bin:/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/devkitpro/devkitARM/bin

# PowerLevel9k config
# More info on https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
if [[ "$OSTYPE" == linux* ]]; then
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status dir_writable background_jobs public_ip root_indicator context_joined command_execution_time time)
    POWERLEVEL9K_DIR_HOME_BACKGROUND='cyan'
    POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='cyan'
    POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='cyan'
    POWERLEVEL9K_STATUS_OK_BACKGROUND='023'
    POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD='1'
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\u2570\uf460 "
    POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=6
elif [[ "$OSTYPE" == freebsd* ]]; then
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status dir_writable background_jobs root_indicator context_joined command_execution_time time)
    POWERLEVEL9K_DIR_HOME_BACKGROUND='009'
    POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='009'
    POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='009'
    POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD='1'
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\u2570\uf460 "
    POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=6
else
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status dir_writable background_jobs root_indicator context_joined command_execution_time time)
fi
POWERLEVEL9K_PUBLIC_IP_BACKGROUND='cyan'
POWERLEVEL9K_PUBLIC_IP_FOREGROUND='black'
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uf113 '

# Highlights
#
# Colors
# Magenta = 165      Cyan    = 030      Yellow  = 178
# Red     = 160      Blue    = 033      Green   = 028
# Orange  = 208      Purple  = 093
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
# brackets
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=033,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=160,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=178,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=165,bold'
# cursor
#ZSH_HIGHLIGHT_STYLES[cursor]='bg=033'
# main
# default
ZSH_HIGHLIGHT_STYLES[default]='none'
# unknown
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=160'
# command
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=165,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=208'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=028,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=028,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=028'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=208,underline' #DarkOrange
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=178'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=028'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=033'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=033,underline'
# path
ZSH_HIGHLIGHT_STYLES[path]='fg=178' #Yellow
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=178'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=178'
# shell
ZSH_HIGHLIGHT_STYLES[globbing]='fg=030'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=033'
ZSH_HIGHLIGHT_STYLES[assign]='fg=165'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=093,underline'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=093,underline'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=093'
# quotes
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=165,underline'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=165'
# pattern example
#ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=160')
# root example
#ZSH_HIGHLIGHT_STYLES[root]='bg=160'
