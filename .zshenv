# Wayland stuff
#GDK_BACKEND=wayland
#CLUTTER_BACKEND=wayland

#SWAY_CURSOR_THEME=capitaine-cursors

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# GPG keys
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

# SSH keys
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# DevKitPro
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM

# C/C++ config
export CC=clang
export CXX=clang++

# Cargo target dir'
export RUST_ROOT="$HOME/.cargo/bin"
export CARGO_TARGET_DIR="$HOME/.cargo/target"
export RUSTC_WRAPPER=""
# Maybe add in the future: -Zchalk -Zpolonius -Zunleash-the-miri-inside-of-you -Zshare-generics=y
# export RUSTFLAGS="-Clink-arg=-fuse-ld=lld -Zmacro-backtrace"
# export RUSTFLAGS="-Zmacro-backtrace"

# Janet
export JANET_BINPATH="$HOME/.local/janet/bin"
export JANET_MODPATH="$HOME/.local/janet"
export JANET_PATH="$HOME/.local/janet/"
# export JANET_LIBPATH="$HOME/.local/janet/lib"
# export JANET_HEADERPATH="$HOME/.local/janet/include/janet"
export JANET_LIBPATH="/usr/lib"
export JANET_HEADERPATH="/usr/include/janet"
export JANET_MANPATH="$HOME/.local/share/man"

# Julia
export JULIA_NUM_THREADS=4

# R lib dir
export R_LIBS_USER="$HOME/.R/"
export R_LIBS="$HOME/.R/"

# Carp Lisp
export CARP_DIR="$HOME/.local/lib/carp/"
#export CARP_DIR=~/MySources/CarpProjects/Carp/

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Node
export NODE_PATH="$HOME/.local/node_modules"
export NPM_STORE="${HOME}/.local/node_modules"

# Library path for DEVKIT SDK
export DEVKITPRO="/opt/devkitpro"
export DEVKITARM="/opt/devkitpro/devkitARM"

# Go
export GOMODCACHE="$HOME/.local/go/pkg/mod"
export GOPATH="$HOME/.local/go/"

# Path to programs
export PATH="$PATH:$HOME/.local/node_modules/vsce/out:$HOME/.local/bin:$HOME/.local/sbin:$HOME/.local/janet/bin:$HOME/.cargo/bin:$HOME/.emacs.d/bin:$HOME/.local/bin/MATLAB/R2019a/bin:$DENO_INSTALL/bin:$HOME/.opam/default/bin:$HOME/.opam/default/sbin:$HOME/.nix-profile/bin:$GOPATH/bin:$HOME/.dotnet/tools:$NPM_STORE/bin"


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
