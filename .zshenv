# Wayland stuff
GDK_BACKEND=wayland
CLUTTER_BACKEND=wayland

SWAY_CURSOR_THEME=capitaine-cursors

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# ssh keys
export SSH_KEY_PATH="~/.ssh/rsa_id"


# Cargo target dir'
export RUST_ROOT=~/.cargo/bin
export CARGO_TARGET_DIR=~/MySources/.cargo_target

# Julia
export JULIA_NUM_THREADS=8

# R lib dir
export R_LIBS_USER=~/.R/
export R_LIBS=~/.R/

# Carp Lisp
export CARP_DIR=~/.local/lib/carp/

# Janet Lisp libraries path
#export JANET_PATH=/usr/lib/janet
# :~/.local/lib/janet

# Library path for DEVKIT SDK
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM

# Path to programs
#export PATH=/bin:/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/devkitpro/devkitARM/bin:~/.local/bin:~/.cargo/bin/
export PATH=$PATH:~/.local/bin:~/.local/sbin:~/.cargo/bin

# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
#  __conda_setup="$(CONDA_REPORT_ERRORS=false '/home/grayjack/.anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
#  if [ $? -eq 0 ]; then
#      eval "$__conda_setup"
#  else
#      if [ -f "/home/grayjack/.anaconda3/etc/profile.d/conda.sh" ]; then
#          . "/home/grayjack/.anaconda3/etc/profile.d/conda.sh"
#          CONDA_CHANGEPS1=false conda activate base
#      else
#          export PATH="/home/grayjack/.anaconda3/bin:$PATH"
#      fi
#  fi
#  unset __conda_setup
# <<< conda init <<<

# opam configuration
test -r /home/grayjack/.opam/opam-init/init.zsh && . /home/grayjack/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# PowerLevel9k config
# More info on https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
if [[ "$OSTYPE" == linux* ]]; then
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status dir_writable background_jobs root_indicator context_joined command_execution_time)
#    POWERLEVEL9K_DIR_HOME_BACKGROUND='cyan'
#    POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='cyan'
#    POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='cyan'
#    POWERLEVEL9K_STATUS_OK_BACKGROUND='023'
    POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD='1'
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\u2570\uf460 "
    POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=6
elif [[ "$OSTYPE" == freebsd* ]]; then
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status dir_writable background_jobs root_indicator context_joined command_execution_time)
    POWERLEVEL9K_DIR_HOME_BACKGROUND='009'
    POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='009'
    POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='009'
    POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD='1'
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\u2570\uf460 "
    POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=6
else
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status dir_writable background_jobs root_indicator context_joined command_execution_time)
fi
POWERLEVEL9K_PUBLIC_IP_BACKGROUND='cyan'
POWERLEVEL9K_PUBLIC_IP_FOREGROUND='black'
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uf113'
