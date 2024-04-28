#!/usr/bin/env bash

show_status=false
disconnect=false

while [ $# -gt 0 ]; do
    key="$1"

    case $key in
    --status)
        show_status=true
        shift
        ;;
    --disconnect)
        disconnect=true
        shift
        ;;
    *)
        echo "Invalid option: $1"
        exit 1
        ;;
    esac
done

if [ "$show_status" = "true" ]; then
    if pgrep -f "^ssh -D 1337 -q -C -N" >/dev/null; then
        printf '{"text": "󱠾", "tooltip": "SSH tunnel to %s connected", "class": "connected"}' "$SSH_TUNNEL_TARGET"
    else
        printf '{"text": "󱠾", "tooltip": "SSH tunnel to %s disconnected", "class": "disconnected"}' "$SSH_TUNNEL_TARGET"
    fi
elif [ "$disconnect" = "true" ]; then
    pgrep -f "^ssh -D 1337 -q -C -N" | xargs -r kill
else
    if [ -z "$SSH_TUNNEL_TARGET" ]; then
        echo "SSH_TUNNEL_TARGET is not set"
        exit 1
    fi

    if ! pgrep -f "^ssh -D 1337 -q -C -N" >/dev/null; then
        nohup ssh -D 1337 -q -C -N "$SSH_TUNNEL_TARGET" >/dev/null &
        disown
    fi
fi
