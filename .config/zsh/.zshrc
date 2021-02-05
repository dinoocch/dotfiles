bindkey -v
export KEYTIMEOUT=25

source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/alternatives.zsh
source ~/.config/zsh/completion.zsh
source ~/.config/zsh/history.zsh
source ~/.config/zsh/opts.zsh
source ~/.config/zsh/os.zsh
source ~/.config/zsh/prompt.zsh

source ~/.config/zsh/lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
