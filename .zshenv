source /etc/profile

# export JAVA_HOME=/usr/lib/jvm/java-openjdk
java_home_priority=(
	/Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home
	/export/apps/jdk/JDK-1_8_0_172
	/opt/jdk-13
	/usr/lib/jvm/java-11-openjdk
	/usr/lib/jvm/java-openjdk
	/usr/lib/jvm/java
)
for java_choice in $java_home_priority; do
	if [[ -d "$java_choice" ]]; then
		export JAVA_HOME=$java_choice
		break
	fi
done

path=(
	~/bin
	~/go/bin
	~/.cargo/bin
	/usr/local/{bin,sbin}
	$JAVA_HOME/bin
	~/.yarn/bin
	~/.config/yarn/global/node_modules/.bin
	~/.dotnet
	~/.local/bin
	$path
)

fpath=(
	~/.config/zsh/completion
	/usr/local/linkedin/etc/zsh
	"${fpath[@]}"
)

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

export PAGER='less'

# if (( $+commands[alacritty] )) {
# 	export TERMINAL='alacritty'
# } elif (( $+commands[urxvt256c] )) {
# 	export TERMINAL='urxvt256c'
# } elif (( $+commands[urxvt] )) {
# 	export TERMINAL='urxvt'
# } else {
# 	export TERMINAL='xterm'
# }
export TERMINAL='alacritty'
export LANG='en_US.UTF-8'
typeset -gU cdpath fpath mailpath path


export GOPATH="$HOME/go"
export QT_STYLE_OVERRIDE=gtk

if (( $+commands[rustc] )) {
	export RUST_SRC_PATH="$(echo "$(rustc --print sysroot)/lib/rustlib/src/rust/src")"
}

# Yeah, idk
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
export _JAVA_AWT_WM_NONREPARTENTING=1
export GPG_TTY="$(tty)"
