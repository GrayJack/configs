export TERM="xterm-256color" 
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/$USER/.oh-my-zsh

# This need to be setup before ZSH_THEME for PowerLevel9k theme, 
# comment if this theme is not in use
# If you use a normal powerline font you have to comment all 3
# Only choose the one you're using
POWERLEVEL9K_MODE='nerdfont-complete'
# POWERLEVEL9K_MODE='awesome-fontconfig'
# POWERLEVEL9K_MODE='awesome-patched'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=14

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# Remove archlinux if not arch based distro or pacBSD
plugins=(git git-extra zsh-completions zsh-autosuggestions zsh-syntax-highlighting archlinux history sudo lol)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
if [[ "$OSTYPE" == linux* ]]; then
    alias clean-cache="echo 3 | sudo tee /proc/sys/vm/drop_caches"
    alias restart-bluetooth="sudo systemctl restart bluetooth"
fi

# Library path for some programs 
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM

# Path to programs
export PATH=/bin:/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/devkitpro/devkitARM/bin

# PowerLevel9k config
# More info on https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
if [[ "$OSTYPE" == linux* ]]; then
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status dir_writable root_indicator background_jobs public_ip context time)
    POWERLEVEL9K_DIR_HOME_BACKGROUND='cyan'
    POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='cyan'
    POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='cyan'
    POWERLEVEL9K_STATUS_OK_BACKGROUND='023'
elif [[ "$OSTYPE" == freebsd* ]]; then
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status dir_writable root_indicator background_jobs context time)
    POWERLEVEL9K_DIR_HOME_BACKGROUND='009'
    POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='009'
    POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='009'
else 
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status dir_writable root_indicator background_jobs context time)
fi
POWERLEVEL9K_PUBLIC_IP_BACKGROUND='cyan'
POWERLEVEL9K_PUBLIC_IP_FOREGROUND='black'
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uf113 '
#POWERLEVEL9K_OS_ICON=$'\uf312'

# fix icons cut on konsole/yakuake 
# comment if on GTK since it's not needed
for key in ${(k)icons[@]}
do
    if [[ ! $key =~ 'SEPARATOR' ]]
    then
        icons[$key]="${icons[$key]} "
    fi
done

# Highlights
# highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
# brackets
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=magenta,bold'
# cursor
#ZSH_HIGHLIGHT_STYLES[cursor]='bg=blue'
# main
# default
ZSH_HIGHLIGHT_STYLES[default]='none'
# unknown
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
# command
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=208,underline' #DarkOrange
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue'
# path
ZSH_HIGHLIGHT_STYLES[path]='fg=178' #Yellow
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=178'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=178'
# shell
ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=blue'
ZSH_HIGHLIGHT_STYLES[assign]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=092,underline'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=092'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=092'
# quotes
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=magenta,underline'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=magenta'
# pattern example
#ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
# root example
#ZSH_HIGHLIGHT_STYLES[root]='bg=red'

# Remove the comment below if you're using tilix terminal to avoid a little problem
#if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
#        source /etc/profile.d/vte.sh
#fi
