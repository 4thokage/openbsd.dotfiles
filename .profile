# $OpenBSD: dot.profile,v 1.5
# I keep all the system configs here, this file will be sourced by xenodm

# PATH setup
PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin

# Programs
export EDITOR="nvim"
export FCEDIT=$EDITOR
export FILE="lf"
export TERM="st"
export BROWSER="nsurf"
export PAGER="less"

# ~/ Cleanup:
export HISTFILE="$HOME/.cache/.zsh_history"
export HISTSIZE=20000
export LESSHISTFILE="-"
export INPUTRC="$HOME/.config/inputrc"
export ZDOTDIR="$HOME/.config/zsh"
export XDG_CONFIG_HOME=$HOME/.config


# Other settings:
export CLICOLOR=1
export LC_ALL=C
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export GTK_IM_MODULE=xim
export LESSCHARSET=utf-8
export LESS='-iMRS -x2'
export LESS_TERMCAP_mb="$(printf '%b' '')"
export LESS_TERMCAP_md="$(printf '%b' '')"
export LESS_TERMCAP_me="$(printf '%b' '')"
export LESS_TERMCAP_so="$(printf '%b' '')"
export LESS_TERMCAP_se="$(printf '%b' '')"
export LESS_TERMCAP_us="$(printf '%b' '')"
export LESS_TERMCAP_ue="$(printf '%b' '')"
