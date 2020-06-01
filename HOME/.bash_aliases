# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
fi

# Modified commands
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias ping='ping -c 5'
alias free='free -m'

# New commands
alias du1='du --max-depth=1'

# More ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Safety features
alias cp='cp -irv'
alias mv='mv -iv'
alias rm='rm -Irv'  # 'rm -i' prompts for every file
alias ln='ln -iv'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Make Bash error tolerant
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'

# extract - archive extractor
# usage: extract <file>
extract ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


## Work-related aliases and functions
alias osr-vpn='sudo openvpn --config ~/Documents/client.ovpn'  # hard link to file
alias sx-vpn='globalprotect connect -p connect.spacex.com'
alias sx-stat='globalprotect show --status'
alias no-sx='globalprotect disconnect'

work_wrapper() {  # should never be called on its own, but could be
    if [ $# -lt 1 ]
    then
        exit 1
    fi
    MACHINE=`echo "$1" | sed 's/./\L&/g'`  # ensure it's lowercase
    if [ $# -eq 1 ]
    then
        echo 'ssh -YC mstacey@'$MACHINE'.lan.odysseyspace.net'
        ssh -YC mstacey@$MACHINE.lan.odysseyspace.net
    else
        case $2 in
            mount)
                echo 'sshfs mstacey@'$MACHINE'.lan.odysseyspace.net:/home/mstacey/ ~/'$MACHINE'/'
                sshfs mstacey@$MACHINE.lan.odysseyspace.net:/home/mstacey/ ~/$MACHINE/
                ;;
            unmount)
                echo 'fusermount -u /home/matt/'$MACHINE
                fusermount -u /home/matt/$MACHINE
                ;;
            key)
                echo 'ssh-copy-id -i ~/.ssh/id_rsa.pub mstacey@'$MACHINE'.lan.odysseyspace.net'
                ssh-copy-id -i ~/.ssh/id_rsa.pub mstacey@$MACHINE.lan.odysseyspace.net
                ;;
            *)
                echo 'bad option: '$2
                ;;
        esac
    fi
}

aore () {
    work_wrapper aore $@
}

udot () {
    work_wrapper udot $@
}
