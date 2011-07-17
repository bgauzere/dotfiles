# ~/.bashrc: executed by bash(1) for non-login shells.
# see  /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
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
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#Google tasks
alias gtasks='conkeror http://mail.google.com/tasks/ig'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
PS1='\h>'

export JAVA_HOME="/usr/lib/jvm/java-6-sun/"

export EDITOR=emacs

# GIRL
export PATH=/home/bgauzere/Cours/Master_2/SAI/segmentation/bin:$PATH
export LD_LIBRARY_PATH=/home/bgauzere/Cours/Master_2/SAI/segmentation/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=/home/bgauzere/Cours/Master_2/SAI/segmentation/lib/pkgconfig:$PKG_CONFIG_PATH

#mes couleurs
LS_COLORS='no=00:fi=00:di=04;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31
:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.b
mp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*
.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.aiff=01;35:*.pdf=00;36:*.ps=01;36:';
export LS_COLORS

#PANDORE
PANDOREHOME=/usr/local/pandore
PATH=$PANDOREHOME/bin:$PATH
LD_LIBRARY_PATH=$PANDOREHOME/lib:$LD_LIBRARY_PATH
export PANDOREHOME PATH LD_LIBRARY_PATH

export PATH=/home/bgauzere/bin:$PATH


#SERVEURS GREYC
export CYBELE="gauzere@cybele.ecole.ensicaen.fr"
export LYRE="bgauzere@lyre.greyc.ensicaen.fr"
export CVS_RSH=ssh

shopt -s histappend
HISTSIZE=100000
HISTFILESIZE=250000

#Mise a jour TODO Lists
if [ -e ~/bin/wakeup ]
then
    $HOME/bin/wakeup
fi

#Chem Cpp
LD_LIBRARY_PATH=$HOME/dev/chemcpp_1.0.2/src/:$LD_LIBRARY_PATH

# txtrst=$(tput sgr0)
# txtred=$(tput setaf 1)
# trap '' 9
# for i in $(seq 1 10000)
# do
#     t=""
#     for j in $(seq 1 $i)
#     do  
# 	t="$t "
#     done
#     echo "$t ${txtred}Il faut toujours locker sa session lorsque l'on s'en va !!!!${txtrst}"
#     sleep 0.05
# done
# trap 9
