# ~/.bashrc: executed by bash(1) for non-login shells.

bind 'TAB: complete'

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

## When in screen session, use window specific history
if test $WINDOW
then
  HISTFILE=~/.bash_history.${WINDOW}
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# Assure we write to history file immediately
export PROMPT_COMMAND="history -a; history -c; history -r; ${PROMPT_COMMAND}"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


export LESS='-erX'
export EDITOR=vim
export PGUSER=www-data

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
export HISTCONTROL=ignoredups
eval `dircolors`
alias ls='ls $LS_OPTIONS'
alias l='ls $LS_OPTIONS -Fahl'
alias ltra='ls -ltra'

# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Add new git log format
alias gitlog="git log --graph --all --pretty='format:%C(auto)%h %C(cyan)%ar %C(auto)%d %C(magenta)%an %C(auto)%s'"

bind 'TAB: complete'

# set variable identifying the chroot you work in (used in the prompt below), ubuntu only
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -f ~/.dockerenv ]; then
		source ~/.dockerenv
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# ~/.bashrc: executed by bash(1) for non-login shells.


if [ -f $HOME/.ssh/saveagent ]; then
  echo "Saving agent"
  . $HOME/.ssh/saveagent
fi

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

parse_git_branch()
{
  local BRANCH=$(git symbolic-ref HEAD --short 2> /dev/null)
  if [[ ! -z "$BRANCH" ]]
  then
    echo "($BRANCH)"
  fi
}

BLACK='\[\e[0;30m\]'      # Black - Regular
RED='\[\e[0;31m\]'        # Red
GREEN='\[\e[0;32m\]'      # Green
YELLOW='\[\e[0;33m\]'     # Yellow
BLUE='\[\e[0;34m\]'       # Blue
PURPLE='\[\e[0;35m\]'     # Purple
CYAN='\[\e[0;36m\]'       # Cyan
WHITE='\[\e[0;37m\]'      # White
BLACK_BOLD='\[\e[1;30m\]'   # Black - Bold
RED_BOLD='\[\e[1;31m\]'     # Red - Bold
GREEN_BOLD='\[\e[1;32m\]'   # Green - Bold
YELLOW_BOLD='\[\e[1;33m\]'  # Yellow - Bold
BLUE_BOLD='\[\e[1;34m\]'    # Blue - Bold
PURPLE_BOLD='\[\e[1;35m\]'  # Purple - Bold
CYAN_BOLD='\[\e[1;36m\]'    # Cyan - Bold
WHITE_BOLD='\[\e[1;37m\]'   # White - Bold
RESET='\[\e[0m\]'         # Text Reset
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] ${YELLOW}\$(parse_git_branch) ${WHITE}$ "


# grep aliases
alias grepsvn='grep -rIl --exclude-dir=.svn'

alias gitsvn='git svn'

if [ `id -u` -eq 0 ]; then
#  export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/bin/X11:/usr/games:~/local/lib/python:~/local/lib/python/lfm"
  export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/bin/X11:/usr/games:~/local/lib/python/lfm"
fi

# export PYTHONPATH="/home/ltjeg/local/lib/python/"

# python on Git Bash Systems (on BURAUT machine)
if [[ $HOSTNAME == "CP001969" ]]; then
  alias python="/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/Shared/Python37_64/python.exe"
fi

PATH=/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/:"$PATH"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/priv/ncurses-6.0/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/local/lib

PATH=~/priv/ncurses-6.0/lib:"$PATH"
# set PATH so it includes user's private bin if it exists
if [ -d ~/local/bin ] ; then
    PATH=~/local/bin:"$PATH"
fi

if [ -d ~/local/lib ] ; then
    PATH=~/local/lib:"$PATH"
fi

if [ -d ~/bin ] ; then
   PATH=~/bin:"${PATH}"
fi

if [ -d ~/node ] ; then
    PATH=~/node/out/Release:"${PATH}"
fi

if [ -d ~/npm ] ; then
    PATH=~/node/out/bin:"${PATH}"
fi

if [ -d ~/jslint ] ; then
    PATH=~/node/out/bin:"${PATH}"
fi

if [ -d ~/local/lib/python ] ; then
    PATH=~/local/lib/python:"$PATH"
fi

if [ -d ~/local/lib/python/lfm ] ; then
    PATH=~/local/lib/python/lfm:"$PATH"
fi

if [ -d ~/.gem/ruby/1.8/bin ] ; then
    PATH=~/.gem/ruby/1.8/bin:"$PATH"
fi


if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi


alias homegit='git --git-dir=$HOME/.homegit --work-tree=$HOME'
alias apache2ctl='/usr/sbin/apache2ctl'
alias apa='sudo apache2ctl graceful'
alias chb='make user; apa'
alias nose='.venv/bin/nosetests -I test_links.py -I test_wmtscapabilities_auth.py -I test_wmtsgettile.py -I test_varnish.py -I test_file_storage.py'
alias gab='make user'
alias vimenc='vim -c '\''let $enc = &fileencoding | execute "!echo Encoding:  $enc" | q'\'''
alias wintersmith='~/node_modules/wintersmith/bin/wintersmith'
alias ch='cd ~/mf-chsdi3'
alias ga='cd ~/mf-geoadmin3'
alias 3d='cd ~/3d-forge'
alias ff='cd ~/ffive'


# Predictable SSH authentication socket location
MY_SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $MY_SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $MY_SOCK
    export SSH_AUTH_SOCK=$MY_SOCK
fi

# Adding gopass completions
_gopass_bash_autocomplete() {
     local cur opts base
     COMPREPLY=()
     cur="${COMP_WORDS[COMP_CWORD]}"
     opts=$( ${COMP_WORDS[@]:0:$COMP_CWORD} --generate-bash-completion )
     local IFS=$'\n'
     COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
     return 0
 }

complete -F _gopass_bash_autocomplete gopass

