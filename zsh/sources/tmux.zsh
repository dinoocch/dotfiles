#!/bin/zsh
# Auto start tmux on ssh
if (( $+commands[tmux] ))
then
  if [[ -n "$SSH_TTY" ]]
  then
    tmux start-server
    if ! tmux has-session 2> /dev/null
    then
	session="$(hostname)"
        tmux new-session -d -s "$session" \; \
          set-option -t "$session" destroy-unattached off &> /dev/null
    fi
    exec tmux attach-session
  fi
fi
