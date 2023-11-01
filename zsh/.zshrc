export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$HOME/go/bin:$PATH"

[[ -z "$ZSH" ]] && export ZSH="${${(%):-%x}:a:h}"

fpath=("$ZSH/completions" "$(brew --prefix)/share/zsh/site-functions" $fpath)

autoload -U colors && colors
autoload -U compaudit compinit zrecompile
autoload -U +X bashcompinit && bashcompinit

zmodload -i zsh/complist
zmodload -F zsh/files b:zf_ln b:zf_mkdir b:zf_rm

source "${ZSH}/plugins/powerlevel10k/powerlevel10k.zsh-theme"
source "${ZSH}/.p10k.zsh"

source "${ZSH}/plugins/colored-man-pages/colored-man-pages.plugin.zsh"
source "${ZSH}/plugins/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh"
source "${ZSH}/plugins/yq-repl/yq.plugin.zsh"
# source "${ZSH}/plugins/jq-zsh-plugin/jq.plugin.zsh"
source "${ZSH}/plugins/zsh-z/zsh-z.plugin.zsh"

eval "$($(brew --prefix)/bin/rtx activate zsh)"

if [[ -f "${ZSH}/cache/.zcompdump" ]]; then
  compinit -C -i -d "${ZSH}/cache/.zcompdump"
else
  compinit -i -d "${ZSH}/cache/.zcompdump"
fi

source "${ZSH}/plugins/zsh-better-npm-completion/zsh-better-npm-completion.plugin.zsh"

source "${ZSH}/plugins/fzf-tab/fzf-tab.plugin.zsh"
source "${ZSH}/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
source "${ZSH}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:zshz:*' sort false

source "${ZSH}/plugins/gradle/gradle.plugin.zsh"
source "${ZSH}/aliases.zsh"

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
