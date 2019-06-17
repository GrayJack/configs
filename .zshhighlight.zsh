color-test() {
    for i in {0..255} ; do
        printf "\x1b[38;5;${i}m%3d " "${i}"
        if (( $i == 15 )) || (( $i > 15 )) && (( ($i-15) % 12 == 0 )); then
            echo;
        fi
    done
}

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main pattern)
# main
## default
ZSH_HIGHLIGHT_STYLES[default]='none'
## unknown
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=013,underline'
## command
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=001'
ZSH_HIGHLIGHT_STYLES[alias]='fg=009'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=009,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=006,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=002,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=002'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=009,underline' #DarkOrange
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=001,underline'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=010'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=004'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=004,underline'
## path
ZSH_HIGHLIGHT_STYLES[path]='fg=003' #Yellow
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=003'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=003'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=003'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=003'
ZSH_HIGHLIGHT_STYLES[path_approx_pathseparator]='fg=003'
## shell
ZSH_HIGHLIGHT_STYLES[globbing]='fg=006'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=004'
ZSH_HIGHLIGHT_STYLES[assign]='fg=001'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=004'
ZSH_HIGHLIGHT_STYLES[comment]='fg=015'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=012,underline'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=012,underline'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=012'
# quotes
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=013,underline'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=013'
