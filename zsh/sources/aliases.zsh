bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

alias ls="ls --color=auto --group-directories -F"
alias grep="grep --color=auto"

alias update="sudo xbps-install -Su"
alias updatey="sudo xbps-install -Suy"

# Overwrites gnu install...oh well
alias install="sudo xbps-install -S"

if (( $+commands[iptables] )) {
  alias firewall="sudo iptables -L -n -v --line-numbers"
}

if (( $+commands[curl] )) {
  alias header='curl -I'
}

if (( $+commands[xclip] )) {
  alias copy="xclip -i -selection clipboard"
  alias yank="xclip -i -selection primary"
}

# Colors are nice
if (( $+commands[grc] )) {
  setopt COMPLETE_ALIASES
  cmds=(
    c++
    cc
    configure
    cvs
    df
    diff
    dig
    gcc
    g++
    ifconfig
    last
    ld
    ldap
    ldapadd
    ldapauth
    ldapdelete
    ldapmodify
    ldapmodrdn
    ldappassd
    ldapsearch
    ldapwhoami
    make
    mount
    mtr
    netstat
    ping
    ping6
    ps
    traceroute
    traceroute6
    wdiff
  );

  for cmd in $cmds
  do
    if (( $+commands[$cmd] )) {
      alias $cmd="grc --colour=auto $cmd"
    }
  done

  unset cmds cmd
}
