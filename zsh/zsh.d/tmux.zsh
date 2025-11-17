if [ -f "$HOME/.config/tmux/session" ] && [ -z "$TMUX" ] && [ -z "$TMUX_RESTORED" ]; then
    if ! tmux list-sessions &>/dev/null; then
        export TMUX_RESTORED=1
        trs
    fi
fi
