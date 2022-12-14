# The following lines were added by compinstall
zstyle :compinstall filename '/Users/columbia/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# exports
export EDITOR=vim
export GOPATH="${HOME}/go"
export KUBECONFIG=$(find "${HOME}/.kube" -name '*.yaml' | paste -sd ':' -)
export OS_CLOUD=beermann
export PATH="${PATH}:${HOME}/.krew/bin"

# aliases
source "${HOME}/.aliases"

# functions
source "${HOME}/.functions"

# keybindings (allow "pos1" and "end" key usage inside terminal)
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
