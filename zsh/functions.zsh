timezsh() {
	shell=${1-$SHELL}
	for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

zshclearcompletions() {
	rm -f "${ZSH}/cache/.zcompdump"
	rm -f "${ZSH}/cache/.zcompdump.zwc"
	zshreload
}

yaml() {
	file=$1
	yq -o=yaml "$file" -C | less -r
}

json() {
	file=$1
	yq -o=json "$file" -C | less -r
}
