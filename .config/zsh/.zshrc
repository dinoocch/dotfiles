bindkey -v
export KEYTIMEOUT=25

for file ($(find ~/.config/zsh/ -name '*.zsh' -not -path '*/lib/*')) source $file; unset file

# Pretty syntax highlighting
source ~/.config/zsh/lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
