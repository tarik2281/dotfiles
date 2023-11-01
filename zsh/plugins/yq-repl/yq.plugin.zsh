if [[ -o zle ]]; then

__get_query() {
    if [ "${YQ_ZSH_PLUGIN_EXPAND_ALIASES:-1}" -eq 1 ]; then
        unset 'functions[_yq-plugin-expand]'
        functions[_yq-plugin-expand]=${LBUFFER}
        (($+functions[_yq-plugin-expand])) && COMMAND=${functions[_yq-plugin-expand]#$'\t'}
        yq-repl -- ${COMMAND}
        return $?
    else
        yq-repl -- ${LBUFFER}
        return $?
    fi
}

yq-complete() {
    local query="$(__get_query)"
    local ret=$?
    if [ -n "$query" ]; then
        LBUFFER="${LBUFFER} | ${YQ_REPL_YQ:-yq}"
        [[ -z "$YQ_REPL_ARGS" ]] || LBUFFER="${LBUFFER} ${YQ_REPL_ARGS}"
        LBUFFER="${LBUFFER} '$query'"
    fi
    zle reset-prompt
    return $ret
}

yq-complete-json() {
    YQ_REPL_ARGS="-o=json"
    local query="$(__get_query)"
    local ret=$?
    if [ -n "$query" ]; then
        LBUFFER="${LBUFFER} | ${YQ_REPL_YQ:-yq}"
        [[ -z "$YQ_REPL_ARGS" ]] || LBUFFER="${LBUFFER} ${YQ_REPL_ARGS}"
        LBUFFER="${LBUFFER} '$query'"
    fi
    zle reset-prompt
    return $ret
}

yq-complete-properties() {
    YQ_REPL_ARGS="-o=props"
    local query="$(__get_query)"
    local ret=$?
    if [ -n "$query" ]; then
        LBUFFER="${LBUFFER} | ${YQ_REPL_YQ:-yq}"
        [[ -z "$YQ_REPL_ARGS" ]] || LBUFFER="${LBUFFER} ${YQ_REPL_ARGS}"
        LBUFFER="${LBUFFER} '$query'"
    fi
    zle reset-prompt
    return $ret
}

zle -N yq-complete
zle -N yq-complete-json
# zle -N yq-complete-properties
# bind `alt + j` to yq-complete
bindkey '\ey' yq-complete
bindkey '\ej' yq-complete-json
# bindkey '\ep' yq-complete-properties

fi

export PATH=$PATH:${0:A:h}/bin
