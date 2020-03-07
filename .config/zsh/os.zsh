# OS Specific configurations

case "$(uname)" in
  Darwin)
    export CLICOLOR=1
    export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
    export BROWSER=open
  ;;
  Linux)
    export BROWSER=firefox
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac
