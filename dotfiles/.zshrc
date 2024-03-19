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
kube_config="$(find "${HOME}/.kube" -name '*.yaml' | paste -sd ':' -)"
export KUBECONFIG="${HOME}/.kube/config:${kube_config}"
export OS_CLOUD=beermann
export PATH="${PATH}:${HOME}/.krew/bin"
export PATH="/opt/homebrew/opt/openjdk/bin:${PATH}"
export PATH="${PATH}:/Users/tbeermann/go/bin"

# aliases
source "${HOME}/.aliases"

# functions
source "${HOME}/.functions"
source "${HOME}/.functions_jenkins"

# additional secrets
source "${HOME}/.config/hcloud"
source "${HOME}/.config/aws"
#source "${HOME}/.config/jira"
#source "${HOME}/.config/jenkins"
#source "${HOME}/.config/age"

# keybindings (allow "pos1" and "end" key usage inside terminal)
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

