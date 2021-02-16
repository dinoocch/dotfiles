alias sudo="sudo "

alias sl="ls"
alias ll="ls -l"
alias la="ls -la"

alias d="pwd"
alias py="python"

alias grep="grep --color=auto"

if (( $+commands[git] )) {
  alias g="git"
  alias gc="git clone"
  alias gp="git push"
  alias gf="git fixup"
  alias gpf="git push -f"
  alias gcd='cd "$(git rev-parse --show-toplevel)"'
  alias gup='cd "$(git rev-parse --show-toplevel)"'
  alias git-up='cd "$(git rev-parse --show-toplevel)"'
  alias gd="git rev-parse --show-toplevel"

  function activate_venv () {
    local git_root
    local venv_bin
    git_root="$(git rev-parse --show-toplevel 2> /dev/null)"
    # If we're in a virtual env and
    if [ -n "${git_root}" ] && [ -z "$VIRTUAL_ENV" ]
    then
      if (( $+commands[fd] )) {
        venv_bin=$(fd -p -I '^.*/.*venv.*/activate$' "${git_root}" | perl -e 'print((sort { length($b) <=> length($a) } <>)[0])')
      } else {
        venv_bin=$(find "${git_root}" -path "*/*venv*/bin/activate" | perl -e 'print((sort { length($b) <=> length($a) } <>)[0])')
      }
      if [ -n "$venv_bin" ]; then
        . "${venv_bin}"
      fi
    fi
  }

  function editor_venv () {
    local git_root
    local venv_bin
    git_root="$(git rev-parse --show-toplevel 2> /dev/null)"
    # If we're in a virtual env and
    if [ -n "${git_root}" ] && [ -z "$VIRTUAL_ENV" ]
    then
      venv_bin=$(find "${git_root}" -path "*/*venv*/bin" | perl -e 'print((sort { length($b) <=> length($a) } <>)[0])')
      if [ -n "$venv_bin" ]; then
        /usr/bin/env PATH="$venv_bin:$PATH" $EDITOR "$@"
      else
        $EDITOR "$@"
      fi
    else
      $EDITOR "$@"
    fi
  }

  alias a="activate_venv"
  alias ev="editor_venv"
  alias ve="editor_venv"
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

alias xjoin='xargs | sed '\''s/ /,/g'\'''

grep-host(){
  if [ -z "$1" ]; then
    set -- "l..1"
  fi
  cat | grep -oE "$1\S+com"
}

ms-date() {
  date --date=@$(( $1 / 1000 ))
}

# Vim things
autoload -Uz surround select-quoted select-bracketed
autoload -U edit-command-line

## Surround Sets
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
# bindkey -M visual S add-surround

# Select-{quoted,bracketed}
zle -N select-quoted
zle -N select-bracketed
# for m in visual viopp; do
#   for c in {a,i}{\',\",\`}; do
#     bindkey -M $m $c select-quoted
#   done
#   for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
#     bindkey -M $m $c select-bracketed
#   done
# done

# Numbers to traverse directory stack
for index ({1..9}) alias "$index"="cd +${index}"; unset index

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias df=dotfiles
alias config=dotfiles
alias da="dotfiles add -u"
alias dc="dotfiles commit"
alias dp="dotfiles push"
alias ds="dotfiles status"

zle -N edit-command-line
bindkey -M vicmd v edit-command-line
