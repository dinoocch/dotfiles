bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

alias sudo="sudo "

alias sl="ls"
alias ll="ls -l"
alias la="ls -la"

alias d="pwd"
alias py="python"

alias grep="grep --color=auto"

alias update="sudo yum update"

if (( $+commands[git] )) {
  alias g="git"
  alias gc="git clone"
  alias gp="git push"
  alias gf="git fixup"
  alias gpf="git push -f"
  alias gcd='cd "$(git rev-parse --show-toplevel)"'
  alias gup='cd "$(git rev-parse --show-toplevel)"'
  alias git-up='cd "$(git rev-parse --show-toplevel)"'
}

if (( $+commands[iptables] )) {
  alias firewall="sudo iptables -L -n -v --line-numbers"
}

if (( $+commands[curl] )) {
  alias header='curl -I'
}

if (( $+commands[ocaml] )) {
  if (( $+commands[rlwrap] )) {
    alias ocaml="rlwrap ocaml"
  }
}

if (( $+commands[xclip] )) {
  alias copy="xclip -i -selection clipboard"
  alias yank="xclip -i -selection primary"
}

# Colors are nice
if (( $+commands[grc] )) {
  setopt COMPLETE_ALIASES
  cmds=(
    ant
    blkid
    c++
    cc
    configure
    cvs
    df
    diff
    dig
    docker-machinels
    dockerimages
    dockerinfo
    dockernetwork
    dockerps
    dockerpull
    dockersearch
    dockerversion
    du
    env
    g++
    gcc
    ifconfig
    ip
    ipaddr
    ipneighbor
    iproute
    iptables
    journalctl
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
    lsblk
    lspci
    nmap
    make
    mount
    mtr
    netstat
    ping
    ping6
    ps
    semanageboolean
    semanagefcontext
    semanageuser
    showmount
    sql
    ss
    stat
    sysctl
    systemctl
    tcpdump
    traceroute
    traceroute6
    ulimit
    uptime
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

if (( $+commands[nvim] )) {
  alias vim=nvim
  alias vi=nvim
}


alias xjoin='xargs | sed '\''s/ /,/g'\'''

grep-host(){
  if [ -z "$1" ]; then
    set -- "l..1"
  fi
  cat | grep -oE "$1\S+com"
}

