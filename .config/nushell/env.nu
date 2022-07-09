# Nushell Environment Config File

# Use oh-my-posh functions to define your right and left prompt
let-env PROMPT_COMMAND = { oh-my-posh print primary --config ~/.poshthemes/powerlevel10k_rainbow.omp.json}
let-env PROMPT_COMMAND_RIGHT = { oh-my-posh print right --config ~/.poshthemes/powerlevel10k_rainbow.omp.json }

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = ""
let-env PROMPT_INDICATOR_VI_INSERT = ": "
let-env PROMPT_INDICATOR_VI_NORMAL = "〉"
let-env PROMPT_MULTILINE_INDICATOR = "::: "

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str collect (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str collect (char esep) }
  }
}

let-env PATH = ($env.PATH | append [$"/home/grayjack/.cargo/bin", $"/home/grayjack/.opam/default/bin", $"/home/grayjack/.opam/default/sbin", $"/home/grayjack/.deno/bin", $"/home/grayjack/.local/go/bin", $"/home/grayjack/.dotnet/tools", $"/home/grayjack/.local/node_modules/bin", $"/home/grayjack/.emacs.d/bin", $"/home/grayjack/.local/janet/bin"])

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | prepend '/some/path')
