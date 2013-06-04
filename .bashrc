# ~/.bashrc: executed by bash(1) for non-login shells.

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
  export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/bin/X11:/usr/games:~/local/lib/python:~/local/lib/python/lfm"
fi
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


if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi


alias homegit='git --git-dir=$HOME/.homegit --work-tree=$HOME'
