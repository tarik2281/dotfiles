# Aliases

alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -la"

alias h='history'
alias hs='history | grep'

alias tree="tree -C"
alias t="tree -C"
alias t1="tree -C -L 1"
alias t2="tree -C -L 2"
alias t3="tree -C -L 3"
alias t4="tree -C -L 4"

alias ta="tree -C -a"
alias ta1="tree -C -L 1 -a"
alias ta2="tree -C -L 2 -a"
alias ta3="tree -C -L 3 -a"
alias ta4="tree -C -L 4 -a"

alias grep="grep --color=auto"

alias vi="nvim"
alias vim="nvim"

alias zshrc="zsh -c \"cd \${ZSH} && nvim .zshrc\""

# docker

alias d="docker"
alias dc="docker compose"
alias drmia="docker rmi -f \$(docker images -aq)"

# nerdctl

alias n="nerdctl"
alias nk="nerdctl -n k8s.io"

# sepoctl

alias s="sepoctl"
alias sa="sepoctl argocd"
alias sab="sepoctl argocd branch"
alias sabr="sepoctl argocd branch reset"
alias sas="sepoctl argocd sync"
alias sal="sepoctl argocd list"
alias sad="sepoctl argocd delete"
alias sao="sepoctl argocd open"
alias sb="sepoctl build"
alias sl="sepoctl logs"
alias skc="sepoctl keycloak"
alias spg="sepoctl postgres"
alias spf="sepoctl port-forward"
alias sr="sepoctl restart"
alias ss="sepoctl shell"

# kubectl

alias kctx="kubectx"
alias kns="kubens"

alias k="kubectl"
alias kg="kubectl get"
alias kgp="kubectl get pods"
alias kgs="kubectl get services"
alias kgi="kubectl get ingress"
alias kgc="kubectl get configmap"
alias kgd="kubectl get deployment"
alias kgn="kubectl get namespace"

alias kd="kubectl describe"

alias krm="kubectl delete"

alias klo="kubectl logs"

alias kpf="kubectl port-forward"

alias keti="kubectl exec -ti"

