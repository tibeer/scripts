# The following lines were added by compinstall
zstyle :compinstall filename "${HOME}/.zshrc"

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
export PATH="${PATH}:${HOME}/go/bin"
export PATH="${PATH}:${HOME}/.local/bin"
export DOCKER_HOST="unix://$(podman machine inspect --format '{{.ConnectionInfo.PodmanSocket.Path}}')"

# aliases
source "${HOME}/.aliases"

# functions
source "${HOME}/.functions"
source "${HOME}/.functions_jenkins"

# additional secrets
source "${HOME}/.config/age"
source "${HOME}/.config/atlassian"
source "${HOME}/.config/aws"
source "${HOME}/.config/equinix"
source "${HOME}/.config/hcloud"
source "${HOME}/.config/jenkins"
source "${HOME}/.config/glab"
source "${HOME}/.config/google"
source "${HOME}/.config/openfga"

# keybindings (allow "pos1" and "end" key usage inside terminal)
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Added by LM Studio CLI (lms)
export PATH="$PATH:${HOME}/.lmstudio/bin"
