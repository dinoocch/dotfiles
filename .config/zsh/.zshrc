bindkey -v
export KEYTIMEOUT=25

source ~/.zinit/bin/zinit.zsh
zinit light zinit-zsh/z-a-bin-gem-node

zinit wait lucid light-mode for \
    atinit"zicompinit; zicdreplay" \
        zdharma/fast-syntax-highlighting \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions \
    from"gh-r" sbin"starship" \
        starship/starship

zinit wait"1" lucid from"gh-r" as"null" for \
    sbin"**/fd" @sharkdp/fd \
    sbin"**/bat" @sharkdp/bat \
    sbin"**/sk" @lotabout/skim \
    sbin"exa* -> exa" ogham/exa \
    sbin"**/nvim -> nvim" neovim/neovim

zinit wait"1" lucid for \
    pick"shell/key-bindings.zsh" id-as"skim-full" lotabout/skim

source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/alternatives.zsh
source ~/.config/zsh/completion.zsh
source ~/.config/zsh/history.zsh
source ~/.config/zsh/opts.zsh
source ~/.config/zsh/os.zsh
source ~/.config/zsh/prompt.zsh

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
