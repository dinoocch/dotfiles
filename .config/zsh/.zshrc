bindkey -v
export KEYTIMEOUT=25

source ~/.zinit/bin/zinit.zsh
zinit light zinit-zsh/z-a-bin-gem-node


# Cries
# Figure out how to make this better someday
# Very slightly modified from the volta install script
volta_version_str() {
    case "$(uname -s)" in
        Darwin)
            if [ "$(uname -m)" == "arm64" ]; then
                echo "macos-aarch64"
            else
                echo "macos"
            fi
            return 0
        ;;
        Linux)
            if [[ "$(openssl version)" =~ ^[^\ ]*\ ([0-9]+\.[0-9]+) ]]; then
                major_minor_version="${match[1]}"
                if [ "$major_minor_version" = '1.0' ] && [ -f "/usr/lib64/libcrypto.so.10" ]; then
                    echo "linux*rhel"
                else
                    echo "linux*$major_minor_version"
                fi
                return 0
            fi
        ;;
    esac
    return 1
}

zinit wait lucid light-mode for \
    atinit"zicompinit; zicdreplay" \
        zdharma/fast-syntax-highlighting \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions \
    from"gh-r" sbin"starship" \
        starship/starship

zinit wait"1" lucid from"gh-r" as"program" for \
    sbin"**/fd" @sharkdp/fd \
    sbin"**/bat" @sharkdp/bat \
    sbin"**/sk" @lotabout/skim \
    sbin"exa* -> exa" ogham/exa \
    sbin"**/nvim -> nvim" neovim/neovim \
    sbin"volta*" bpick"*$(volta_version_str)*" volta-cli/volta

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
