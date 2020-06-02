# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Ensure environment is set properly, if .bash_profile isn't loaded
export EDITOR=vim
export TERM='xterm-256color'

# if this is the SpaceX laptop
[ "$HOSTNAME" == "mstacey-840" ]  && export TERM='screen-256color'

## If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

## History control
# See bash(1) for more options
HISTCONTROL=ignoreboth  # don't put duplicate lines or lines starting with space in the history.
shopt -s histappend  # append to the history file, don't overwrite it
HISTSIZE=1000  # for setting history length]
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


## Prompt setup with colors
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set a color scheme for the terminal
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then  # Assume color support is compliant with Ecma-48 (ISO/IEC-6429)
	color_prompt=yes
    else  # If not, lack of support would tend to support setf rather than setaf
	color_prompt=
fi

# Define colors for ease of use
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
RED="\[\033[01;91m\]"
YELLOW="\[\033[01;93m\]"
GRAY="\[\033[01;00m\]"

# Get git branch for prompt
function __git_branch() {
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch="detached*"
    fi
    if [[ ${#branch} -gt 0 ]]; then
      echo "$branch"
    else
      echo ""
    fi
  fi
}

# Custom prompt
if [ "$color_prompt" = yes ]; then
    export PS1="${RED}\D{%m/%d %H:%M:%S} ${GRAY}${debian_chroot:+($debian_chroot)} ${GREEN}\u@\h ${YELLOW}\$(__git_branch) ${BLUE}\w ${GRAY}\$ "
else
    PS1="\D{%m/%d %H:%M:%S} ${debian_chroot:+($debian_chroot)} \u@\h \$(__git_branch) \w \$ "

fi
unset color_prompt

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
      PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
      ;;
  *)
      ;;
esac
unset debian_chroot

# Alias definitions
shopt -s expand_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Store sourcing time
export BASH_SRC=$(date +"%m/%d %H:%M:%S")


## Work-specific settings

# Make LaTeX not do their annoying 80 character stdout:
export max_print_line=100000
# export PP_NO_DEBUG=foo  # only use if you want LaTeX to log rather than stdout

# Set up Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
