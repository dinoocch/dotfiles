if (( $+commands[nvim] )) {
    export EDITOR="nvim"
    export VISUAL="nvim"
} elif (( $+commands[vim] )) {
    export EDITOR="vim"
    export VISUAL="vim"
} else {
    export EDITOR="vi"
    export VISUAL="vi"
}

if (( $+commands[alacritty] )) {
    export TERMINAL='alacritty'
} elif (( $+commands[urxvt256c] )) {
    export TERMINAL='urxvt256c'
} elif (( $+commands[urxvt] )) {
    export TERMINAL='urxvt'
} else {
    export TERMINAL='xterm'
}

if (( $+commands[nvim] )) {
    alias vim=nvim
    alias vi="/bin/vim -u NONE"
}


if (( $+commands[exa] )) {
    alias ls=exa
}
