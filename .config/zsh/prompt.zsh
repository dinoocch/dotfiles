if (( $+commands[starship] )) {
  eval "$(starship init zsh)"
} else {
  autoload -U colors && colors
  autoload -Uz vcs_info
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' stagedstr '%F{green}*%f'
  zstyle ':vcs_info:*' unstagedstr '%F{yellow}+%f'
  zstyle ':vcs_info:git*' check-for-changes true
  precmd() {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
          zstyle ':vcs_info:*' formats ' %F{blue}[%b%c%u%f%F{blue}]%f'
    } else {
          zstyle ':vcs_info:*' formats ' %F{blue}[%b%c%u%f%F{red}?%f%F{blue}]%f'
    }
    vcs_info

    case ${TERM} in
      xterm*|rxvt*|Eterm|aterm|kterm|gnome*|alacritty)
        printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"
        ;;
      screen*)
        printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"
        ;;
    esac
  }
  if [[ -n $SSH_TTY ]] {
  PROMPT='%F{yellow}%n%f@%F{red}%m%f %F{green}%B%1~%b%f${vcs_info_msg_0_} %# '
  } else {
  PROMPT='%F{yellow}%n%f %F{green}%B%1~%b%f${vcs_info_msg_0_} %# '
  }

  function zle-line-init zle-keymap-select {
    VIM_PROMPT="%F{red}NORMAL%f"
    RPROMPT="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
    zle reset-prompt
  }

  zle -N zle-line-init
  zle -N zle-keymap-select
}
