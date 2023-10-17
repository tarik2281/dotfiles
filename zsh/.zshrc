export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$HOME/go/bin:$PATH"

[[ -z "$ZSH" ]] && export ZSH="${${(%):-%x}:a:h}"

fpath=("$ZSH/completions" $fpath)

autoload -U compaudit compinit zrecompile
zmodload -i zsh/complist
autoload -U +X bashcompinit && bashcompinit
zmodload -F zsh/files b:zf_ln b:zf_mkdir b:zf_rm

source "${ZSH}/plugins/powerlevel10k/powerlevel10k.zsh-theme"

source "${ZSH}/.p10k.zsh"
source "${ZSH}/plugins/zsh-z/zsh-z.plugin.zsh"

source "${ZSH}/aliases.zsh"

eval "$($(brew --prefix)/bin/rtx activate zsh)"
compinit -i -d "${ZSH}/cache/.zcompdump"

source "${ZSH}/plugins/fzf-tab/fzf-tab.plugin.zsh"
source "${ZSH}/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
source "${ZSH}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:zshz:*' sort false
# timezsh() {
#   shell=${1-$SHELL}
#   for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
# }
source "${ZSH}/plugins/gradle/gradle.plugin.zsh"
# source "${ZSH}/completions/sepoctl.plugin.zsh"

# compinit # -i -d "${ZSH}/cache/zcompdump-${ZSH_VERSION}"
