# ~/.bashrc: executed by bash(1) for non-login shells.

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

# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# grep aliases
alias grepsvn='grep -rIl --exclude-dir=.svn'

alias gitsvn='git svn'

if [ `id -u` -eq 0 ]; then
#  export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/bin/X11:/usr/games:~/local/lib/python:~/local/lib/python/lfm"
  export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/bin/X11:/usr/games:~/local/lib/python/lfm"
fi

# export PYTHONPATH="/home/ltjeg/local/lib/python/"

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


source ~/.browserstack

# Predictable SSH authentication socket location
MY_SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $MY_SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $MY_SOCK
    export SSH_AUTH_SOCK=$MY_SOCK
fi

