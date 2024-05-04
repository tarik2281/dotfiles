timezsh() {
	shell=${1-$SHELL}
	for i in $(seq 1 10); do time $shell -i -c exit; done
}

zshclearcompletions() {
	rm -f "${ZSH}/cache/.zcompdump"
	rm -f "${ZSH}/cache/.zcompdump.zwc"
	zshreload
}

yaml() {
	file=$1
	if [ "$file" = "-" ]; then
		yq -o=yaml < /dev/stdin | nvim -c "set filetype=yaml"
		# yq -o=yaml -C < /dev/stdin | less -r
	else
		yq -o=yaml "$file" | nvim -c "set filetype=yaml"
	    # yq -o=yaml "$file" -C | less -r
	fi
}

json() {
	file=$1
	if [ "$file" = "-" ]; then
		yq -o=json < /dev/stdin | nvim -c "set filetype=json"
		# yq -o=json -C < /dev/stdin | less -r
	else
		yq -o=json "$file" | nvim -c "set filetype=json"
	    # yq -o=json "$file" -C | less -r
	fi
}
