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
export RUSTC_WRAPPER=sccache
# Maybe add in the future: -Zpolonius
export RUSTFLAGS="-Zunleash-the-miri-inside-of-you -Zmacro-backtrace"

# Janet
export JANET_MODPATH=~/.local/lib/janet/

# Julia
export JULIA_NUM_THREADS=4

# R lib dir
export R_LIBS_USER=~/.R/
export R_LIBS=~/.R/

# Carp Lisp
export CARP_DIR=~/.local/lib/carp/
#export CARP_DIR=~/MySources/CarpProjects/Carp/

# Deno
export DENO_INSTALL="/home/grayjack/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Library path for DEVKIT SDK
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM

# Path to programs
export PATH=$PATH:~/.local/bin:~/.local/sbin:~/.cargo/bin:~/.emacs.d/bin:/home/grayjack/.local/bin/MATLAB/R2019a/bin:$DENO_INSTALL/bin:$HOME/.opam/default/bin:$HOME/.opam/default/sbin:$HOME/.nix-profile/bin


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
